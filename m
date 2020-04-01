Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D7919A563
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 08:33:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57F098A191;
	Wed,  1 Apr 2020 06:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ughw5FVlvF-S; Wed,  1 Apr 2020 06:33:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00C1F8A178;
	Wed,  1 Apr 2020 06:33:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4210C089F;
	Wed,  1 Apr 2020 06:33:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD713C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 06:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 894732026D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 06:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTmygmqxYsT5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 06:33:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 4D8CD2FAEC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 06:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585722784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JU2gGDmlwnwGl6ycj3faEZggWtmCNjTPrCPYS6/C+MQ=;
 b=G6n9IJBVnrvmgw29JxUGE/ujilRKWPc0MyynzpVY6rhSmmLZ6JSdJZc0Sqe9pg/bFiJnEb
 8gTo/iowDOUSjnSR7QrhEZDMWaWwruKpKY4AqmUQfT2CJUz2zFs+PuFGvqn2Z23XFBz31u
 BXjwl168kKZ0ya7uQrGCqCcrpf4r72E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-G9nP1vRIPQObXvBF-F-xEg-1; Wed, 01 Apr 2020 02:33:03 -0400
X-MC-Unique: G9nP1vRIPQObXvBF-F-xEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 627CF19057B8;
 Wed,  1 Apr 2020 06:33:02 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8305DA0F2;
 Wed,  1 Apr 2020 06:32:57 +0000 (UTC)
Subject: Re: [PATCH] vdpa: move to drivers/vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200331191825.249436-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ee5c17e0-0e28-8979-ff6a-5ea1659a24e0@redhat.com>
Date: Wed, 1 Apr 2020 14:32:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200331191825.249436-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Randy Dunlap <rdunlap@infradead.org>,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8xIOS4iuWNiDM6MTksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBXZSBo
YXZlIGJvdGggdmhvc3QgYW5kIHZpcnRpbyBkcml2ZXJzIHRoYXQgZGVwZW5kIG9uIHZkcGEuCj4g
SXQncyBlYXNpZXIgdG8gbG9jYXRlIGl0IGF0IGEgdG9wIGxldmVsIGRpcmVjdG9yeSBvdGhlcndp
c2UKPiB3ZSBydW4gaW50byBpc3N1ZXMgZS5nLiBpZiB2aG9zdCBpcyBidWlsdC1pbiBidXQgdmly
dGlvCj4gaXMgbW9kdWxhci4gIExldCdzIGp1c3QgbW92ZSBpdCB1cCBhIGxldmVsLgo+Cj4gUmVw
b3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CgoKQWNrZWQtYnk6IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgpUaGFua3MKCgo+IC0tLQo+Cj4gUmFuZHkg
SSdkIHNheSB0aGUgaXNzdWUgeW91IGFyZSByZXBvcnRpbmcgKHZob3N0PXksIHZpcnRpbz1tKQo+
IGlzIGVzb3RlcmljIGVub3VnaCBub3QgdG8gcmVxdWlyZSBhIHJlYmFzZSBmb3IgdGhpcy4KPiBT
byBJJ2QganVzdCBhcHBseSB0aGlzIG9uIHRvcC4KPiBEbyB5b3UgYWdyZWU/Cj4KPiAgIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICAgZHJpdmVy
cy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwo+ICAgZHJpdmVy
cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gICBkcml2ZXJz
L3t2aXJ0aW8gPT4gfS92ZHBhL0tjb25maWcgICAgICAgICAgICAgfCAwCj4gICBkcml2ZXJzL3t2
aXJ0aW8gPT4gfS92ZHBhL01ha2VmaWxlICAgICAgICAgICAgfCAwCj4gICBkcml2ZXJzL3t2aXJ0
aW8gPT4gfS92ZHBhL2lmY3ZmL01ha2VmaWxlICAgICAgfCAwCj4gICBkcml2ZXJzL3t2aXJ0aW8g
PT4gfS92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYyAgfCAwCj4gICBkcml2ZXJzL3t2aXJ0aW8gPT4g
fS92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaCAgfCAwCj4gICBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92
ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyAgfCAwCj4gICBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92ZHBh
L3ZkcGEuYyAgICAgICAgICAgICAgfCAwCj4gICBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92ZHBhL3Zk
cGFfc2ltL01ha2VmaWxlICAgfCAwCj4gICBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmMgfCAwCj4gICBkcml2ZXJzL3ZpcnRpby9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyIC0tCj4gICAxMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gICByZW5hbWUgZHJpdmVycy97dmlydGlvID0+IH0vdmRwYS9LY29u
ZmlnICgxMDAlKQo+ICAgcmVuYW1lIGRyaXZlcnMve3ZpcnRpbyA9PiB9L3ZkcGEvTWFrZWZpbGUg
KDEwMCUpCj4gICByZW5hbWUgZHJpdmVycy97dmlydGlvID0+IH0vdmRwYS9pZmN2Zi9NYWtlZmls
ZSAoMTAwJSkKPiAgIHJlbmFtZSBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92ZHBhL2lmY3ZmL2lmY3Zm
X2Jhc2UuYyAoMTAwJSkKPiAgIHJlbmFtZSBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92ZHBhL2lmY3Zm
L2lmY3ZmX2Jhc2UuaCAoMTAwJSkKPiAgIHJlbmFtZSBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92ZHBh
L2lmY3ZmL2lmY3ZmX21haW4uYyAoMTAwJSkKPiAgIHJlbmFtZSBkcml2ZXJzL3t2aXJ0aW8gPT4g
fS92ZHBhL3ZkcGEuYyAoMTAwJSkKPiAgIHJlbmFtZSBkcml2ZXJzL3t2aXJ0aW8gPT4gfS92ZHBh
L3ZkcGFfc2ltL01ha2VmaWxlICgxMDAlKQo+ICAgcmVuYW1lIGRyaXZlcnMve3ZpcnRpbyA9PiB9
L3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyAoMTAwJSkKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggNzBjNDdiYzU1MzQzLi43Y2ZhNTVjNzY1ZmQgMTAw
NjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xNzY5NSw2
ICsxNzY5NSw3IEBAIEw6CXZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cj4gICBTOglNYWludGFpbmVkCj4gICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdmlydGlvLwo+ICAgRjoJZHJpdmVycy92aXJ0aW8vCj4gK0Y6CWRyaXZlcnMvdmRwYS8KPiAg
IEY6CXRvb2xzL3ZpcnRpby8KPiAgIEY6CWRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ICAgRjoJ
ZHJpdmVycy9ibG9jay92aXJ0aW9fYmxrLmMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9LY29uZmln
IGIvZHJpdmVycy9LY29uZmlnCj4gaW5kZXggN2E2ZDhiMmI2OGI0Li5hYzIzZDUyMGU5MTYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9LY29uZmlnCj4gQEAg
LTEzOCw2ICsxMzgsOCBAQCBzb3VyY2UgImRyaXZlcnMvdmlydC9LY29uZmlnIgo+ICAgCj4gICBz
b3VyY2UgImRyaXZlcnMvdmlydGlvL0tjb25maWciCj4gICAKPiArc291cmNlICJkcml2ZXJzL3Zk
cGEvS2NvbmZpZyIKPiArCj4gICBzb3VyY2UgImRyaXZlcnMvdmhvc3QvS2NvbmZpZyIKPiAgIAo+
ICAgc291cmNlICJkcml2ZXJzL2h2L0tjb25maWciCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvTWFr
ZWZpbGUgYi9kcml2ZXJzL01ha2VmaWxlCj4gaW5kZXggMzFjZjE3ZGVlMjUyLi4yMTY4OGYzYjE1
ODggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvTWFrZWZp
bGUKPiBAQCAtNDIsNiArNDIsNyBAQCBvYmotJChDT05GSUdfRE1BREVWSUNFUykJKz0gZG1hLwo+
ICAgb2JqLXkJCQkJKz0gc29jLwo+ICAgCj4gICBvYmotJChDT05GSUdfVklSVElPKQkJKz0gdmly
dGlvLwo+ICtvYmotJChDT05GSUdfVkRQQSkJCSs9IHZkcGEvCj4gICBvYmotJChDT05GSUdfWEVO
KQkJKz0geGVuLwo+ICAgCj4gICAjIHJlZ3VsYXRvcnMgZWFybHksIHNpbmNlIHNvbWUgc3Vic3lz
dGVtcyByZWx5IG9uIHRoZW0gdG8gaW5pdGlhbGl6ZQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
cnRpby92ZHBhL0tjb25maWcgYi9kcml2ZXJzL3ZkcGEvS2NvbmZpZwo+IHNpbWlsYXJpdHkgaW5k
ZXggMTAwJQo+IHJlbmFtZSBmcm9tIGRyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+IHJlbmFt
ZSB0byBkcml2ZXJzL3ZkcGEvS2NvbmZpZwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92
ZHBhL01ha2VmaWxlIGIvZHJpdmVycy92ZHBhL01ha2VmaWxlCj4gc2ltaWxhcml0eSBpbmRleCAx
MDAlCj4gcmVuYW1lIGZyb20gZHJpdmVycy92aXJ0aW8vdmRwYS9NYWtlZmlsZQo+IHJlbmFtZSB0
byBkcml2ZXJzL3ZkcGEvTWFrZWZpbGUKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmRw
YS9pZmN2Zi9NYWtlZmlsZSBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9NYWtlZmlsZQo+IHNpbWlsYXJp
dHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIGRyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvTWFr
ZWZpbGUKPiByZW5hbWUgdG8gZHJpdmVycy92ZHBhL2lmY3ZmL01ha2VmaWxlCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jIGIvZHJpdmVycy92ZHBh
L2lmY3ZmL2lmY3ZmX2Jhc2UuYwo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9t
IGRyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jCj4gcmVuYW1lIHRvIGRyaXZl
cnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8v
dmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5o
Cj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1lIGZyb20gZHJpdmVycy92aXJ0aW8vdmRw
YS9pZmN2Zi9pZmN2Zl9iYXNlLmgKPiByZW5hbWUgdG8gZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3Zm
X2Jhc2UuaAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX21h
aW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBzaW1pbGFyaXR5IGluZGV4
IDEwMCUKPiByZW5hbWUgZnJvbSBkcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX21haW4u
Ywo+IHJlbmFtZSB0byBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlydGlvL3ZkcGEvdmRwYS5jIGIvZHJpdmVycy92ZHBhL3ZkcGEuYwo+IHNp
bWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIGRyaXZlcnMvdmlydGlvL3ZkcGEvdmRw
YS5jCj4gcmVuYW1lIHRvIGRyaXZlcnMvdmRwYS92ZHBhLmMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aXJ0aW8vdmRwYS92ZHBhX3NpbS9NYWtlZmlsZSBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS9N
YWtlZmlsZQo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIGRyaXZlcnMvdmly
dGlvL3ZkcGEvdmRwYV9zaW0vTWFrZWZpbGUKPiByZW5hbWUgdG8gZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL01ha2VmaWxlCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZkcGEvdmRwYV9zaW0v
dmRwYV9zaW0uYyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4gc2ltaWxhcml0
eSBpbmRleCAxMDAlCj4gcmVuYW1lIGZyb20gZHJpdmVycy92aXJ0aW8vdmRwYS92ZHBhX3NpbS92
ZHBhX3NpbS5jCj4gcmVuYW1lIHRvIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL0tjb25maWcgYi9kcml2ZXJzL3ZpcnRpby9LY29u
ZmlnCj4gaW5kZXggOTllNDI0NTcwNjQ0Li4yYWFkZjM5OGQ4Y2MgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy92aXJ0aW8vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcKPiBAQCAt
MTA5LDUgKzEwOSwzIEBAIGNvbmZpZyBWSVJUSU9fTU1JT19DTURMSU5FX0RFVklDRVMKPiAgIAkg
SWYgdW5zdXJlLCBzYXkgJ04nLgo+ICAgCj4gICBlbmRpZiAjIFZJUlRJT19NRU5VCj4gLQo+IC1z
b3VyY2UgImRyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZyIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
