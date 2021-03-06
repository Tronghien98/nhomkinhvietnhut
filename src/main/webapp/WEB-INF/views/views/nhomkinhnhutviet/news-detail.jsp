<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/components/taglib.jsp" %>
<div id="work_single_banner" class="bg-light w-100">
    <div class="container-fluid text-light d-flex justify-content-center align-items-center border-0 rounded-0 p-0 py-5">
        <div class="banner-content col-lg-8 m-lg-auto text-center py-5 px-3">
            <h1 class="banner-heading h2 pb-5 typo-space-line-center">Digital Marketing</h1>
            <h3 class="h4 pb-2 light-300">Voluptatem accusantium doloremque</h3>
            <p class="banner-footer light-300">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                sed do eiusmod tempor incididunt ut labore et dolore magna
                aliqua. Integer ut ipsum eu libero venenatis euismod.
            </p>
        </div>
    </div>
</div>

<section class="container py-5">
	<
    <div class="row pt-5">
        <div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
            <h2 class="worksingle-heading h3 pb-3 light-300 typo-space-line">${news.title}</h2>
            ${news.detail}
        </div>
    </div>
</section>

<article class="container-fluid bg-light">
    <div class="container">
        <div class="worksingle-related-header row">
            <h1 class="h2 py-5">Bài Viết Liên Quan</h1>
            <div class="col-md-12 text-left justify-content-center">
                <div class="row gx-5">
					<c:forEach items="${listNews}" var="newsByCat">
							 <div class="col-sm-6 col-lg-4 mb-5">
		                        <a href="#" class="related-content card text-decoration-none overflow-hidden h-100">
		                            <img class="related-img card-img-top" src="${urlNewProduct}/${newsByCat.picture}" alt="Card image cap">
		                            <div class="related-body card-body p-4">
		                                <h5 class="card-title h6 m-0 semi-bold-600 text-dark">${stringUtil.setStringCompact(newsByCat.title, 20)}</h5>
		                                <p class="card-text pt-2 mb-1 light-300 text-dark">
		                                   ${stringUtil.setStringCompact(newsByCat.detail, 20)}
		                                </p>
		                                <div class="d-flex justify-content-between">
		                                    <span class="text-primary light-300">Read more</span>
		                                </div>
		                            </div>
		                        </a>
		                    </div>
					</c:forEach>
                </div>
            </div>
        </div>
    </div>
</article>