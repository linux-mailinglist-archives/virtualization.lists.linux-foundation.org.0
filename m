Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 682383037B3
	for <lists.virtualization@lfdr.de>; Tue, 26 Jan 2021 09:17:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC46485198;
	Tue, 26 Jan 2021 08:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3la1v7QT7Oxx; Tue, 26 Jan 2021 08:17:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B43785188;
	Tue, 26 Jan 2021 08:17:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33549C013A;
	Tue, 26 Jan 2021 08:17:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05FBEC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EFAAC86F81
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt5p2gdV7T1B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:17:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4388B86DF0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611649067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kElVC+jkHLstLVhvoAPiIFDGEp54B3rvncUWM43dOQw=;
 b=OCtC+2MpTfjXjitTU4ANCuSm1t64r+nIEdjCUvL6otSskAnR052jbM9sVQqbQzvKlyr2AP
 NmhXa+cnWfmIxHL3/1KLjruu57BDVI02/d6tx0ouPC4X+/KSGi1CinKK6v2bAKn2Pb8BcY
 pjjDiSAo9HT9msdIJqyy+HvZsqxymW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-kXrSMgh9PS6y4-sMWhagKQ-1; Tue, 26 Jan 2021 03:17:43 -0500
X-MC-Unique: kXrSMgh9PS6y4-sMWhagKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07CAD107ACF6;
 Tue, 26 Jan 2021 08:17:41 +0000 (UTC)
Received: from [10.72.12.70] (ovpn-12-70.pek2.redhat.com [10.72.12.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E668E1A839;
 Tue, 26 Jan 2021 08:17:29 +0000 (UTC)
Subject: Re: [RFC v3 11/11] vduse: Introduce a workqueue for irq injection
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 bob.liu@oracle.com, hch@infradead.org, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net
References: <20210119045920.447-1-xieyongji@bytedance.com>
 <20210119050756.600-1-xieyongji@bytedance.com>
 <20210119050756.600-5-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9cacd59d-1063-7a1f-9831-8728eb1d1c15@redhat.com>
Date: Tue, 26 Jan 2021 16:17:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119050756.600-5-xieyongji@bytedance.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-aio@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjEvMS8xOSDkuIvljYgxOjA3LCBYaWUgWW9uZ2ppIHdyb3RlOgo+IFRoaXMgcGF0Y2gg
aW50cm9kdWNlcyBhIGRlZGljYXRlZCB3b3JrcXVldWUgZm9yIGlycSBpbmplY3Rpb24KPiBzbyB0
aGF0IHdlIGFyZSBhYmxlIHRvIGRvIHNvbWUgcGVyZm9ybWFuY2UgdHVuaW5nIGZvciBpdC4KPgo+
IFNpZ25lZC1vZmYtYnk6IFhpZSBZb25namkgPHhpZXlvbmdqaUBieXRlZGFuY2UuY29tPgoKCklm
IHdlIHdhbnQgdGhlIHNwbGl0IGxpa2UgdGhpcy4KCkl0IG1pZ2h0IGJlIGJldHRlciB0bzoKCjEp
IGltcGxlbWVudCBhIHNpbXBsZSBpcnEgaW5qZWN0aW9uIG9uIHRoZSBpb2N0bCBjb250ZXh0IGlu
IHBhdGNoIDgKMikgYWRkIHRoZSBkZWRpY2F0ZWQgd29ya3F1ZXVlIGluamVjdGlvbiBpbiB0aGlz
IHBhdGNoCgpTaW5jZSBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQKCjEpIHRoZSBmdW5jdGlvbiBs
b29rcyBtb3JlIGlzb2xhdGVkIGZvciByZWFkZXJzCjIpIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
c3lzY3RsIHZzIHdvcmtxdWV1ZSBzaG91bGQgYmUgbW9yZSBvYnZpb3VzIAp0aGFuIHN5c3RlbSB3
cSB2cyBkZWRpY2F0ZWQgd3EKMykgYSBjaGFuY2UgdG8gZGVzY3JpYmUgd2h5IHdvcmtxdWV1ZSBp
cyBuZWVkZWQgaW4gdGhlIGNvbW1pdCBsb2cgaW4gCnRoaXMgcGF0Y2gKClRoYW5rcwoKCj4gLS0t
Cj4gICBkcml2ZXJzL3ZkcGEvdmRwYV91c2VyL2V2ZW50ZmQuYyB8IDEwICsrKysrKysrKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZkcGEvdmRwYV91c2VyL2V2ZW50ZmQuYyBiL2RyaXZlcnMvdmRwYS92
ZHBhX3VzZXIvZXZlbnRmZC5jCj4gaW5kZXggZGJmZmRkYjA4OTA4Li5jYWY3ZDhkNjhhYzAgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL3ZkcGFfdXNlci9ldmVudGZkLmMKPiArKysgYi9kcml2
ZXJzL3ZkcGEvdmRwYV91c2VyL2V2ZW50ZmQuYwo+IEBAIC0xOCw2ICsxOCw3IEBACj4gICAjaW5j
bHVkZSAiZXZlbnRmZC5oIgo+ICAgCj4gICBzdGF0aWMgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3Qg
KnZkdXNlX2lycWZkX2NsZWFudXBfd3E7Cj4gK3N0YXRpYyBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVj
dCAqdmR1c2VfaXJxX3dxOwo+ICAgCj4gICBzdGF0aWMgdm9pZCB2ZHVzZV92aXJxZmRfc2h1dGRv
d24oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAgewo+IEBAIC01Nyw3ICs1OCw3IEBAIHN0
YXRpYyBpbnQgdmR1c2VfdmlycWZkX3dha2V1cCh3YWl0X3F1ZXVlX2VudHJ5X3QgKndhaXQsIHVu
c2lnbmVkIGludCBtb2RlLAo+ICAgCV9fcG9sbF90IGZsYWdzID0ga2V5X3RvX3BvbGwoa2V5KTsK
PiAgIAo+ICAgCWlmIChmbGFncyAmIEVQT0xMSU4pCj4gLQkJc2NoZWR1bGVfd29yaygmdmlycWZk
LT5pbmplY3QpOwo+ICsJCXF1ZXVlX3dvcmsodmR1c2VfaXJxX3dxLCAmdmlycWZkLT5pbmplY3Qp
Owo+ICAgCj4gICAJaWYgKGZsYWdzICYgRVBPTExIVVApIHsKPiAgIAkJc3Bpbl9sb2NrKCZ2cS0+
aXJxX2xvY2spOwo+IEBAIC0xNjUsMTEgKzE2NiwxOCBAQCBpbnQgdmR1c2VfdmlycWZkX2luaXQo
dm9pZCkKPiAgIAlpZiAoIXZkdXNlX2lycWZkX2NsZWFudXBfd3EpCj4gICAJCXJldHVybiAtRU5P
TUVNOwo+ICAgCj4gKwl2ZHVzZV9pcnFfd3EgPSBhbGxvY193b3JrcXVldWUoInZkdXNlLWlycSIs
IFdRX1NZU0ZTIHwgV1FfVU5CT1VORCwgMCk7Cj4gKwlpZiAoIXZkdXNlX2lycV93cSkgewo+ICsJ
CWRlc3Ryb3lfd29ya3F1ZXVlKHZkdXNlX2lycWZkX2NsZWFudXBfd3EpOwo+ICsJCXJldHVybiAt
RU5PTUVNOwo+ICsJfQo+ICsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgdm9pZCB2ZHVz
ZV92aXJxZmRfZXhpdCh2b2lkKQo+ICAgewo+ICsJZGVzdHJveV93b3JrcXVldWUodmR1c2VfaXJx
X3dxKTsKPiAgIAlkZXN0cm95X3dvcmtxdWV1ZSh2ZHVzZV9pcnFmZF9jbGVhbnVwX3dxKTsKPiAg
IH0KPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
