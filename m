Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EEF3071
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 14:51:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9B645152D;
	Thu,  7 Nov 2019 13:51:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E5D3D1528
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 13:51:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7725E196
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 13:51:01 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC1924E840
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 13:51:00 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id z26so2322770qkj.11
	for <virtualization@lists.linux-foundation.org>;
	Thu, 07 Nov 2019 05:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=nkZBN+5zxQ42o26GlAg4Gu8zR9MU5cE0CTJ+GrFRdeo=;
	b=S0BYawtVyYjGI1ZKWkY1LSJSM03Kg73tcHj8Dv34zvMQ00z8Kh8vqBNn0zcnrxgW/T
	BWoEmyS4TYBEGVKXh0AYaQiHhwc5WFDx+3e5xDkCWsNGBtc4D4Y4r5sfLcJIYQX+pFlH
	5euBBhQ/9zVQ8juN/0CB6Kjw2XYeK/Q5jJdpzo9G45LtUm8HhtPN/Ta/5yt1KmvGBGMw
	BUIdNgrYJubdQWtjmxSsN25GFi8VNFlj0ta0FphPASAC6yjGI43BY6AYTEw1ZwiYSoZv
	j2xOkO1CbAXfE4cmVoTImLYYipLTmOW/MEnBiUcNcjkfHTSQcZBC1Vu2gSwInDQXKJ3U
	2Yyw==
X-Gm-Message-State: APjAAAW+1wmuOeQxFVoaIxP8EAywm/vp3RFGECiUGnBbx7kXjfeGLthg
	+4R7EY/CNQ74voxk8+fDU0h8HhsfF0swAMAL90K3yymAURvC0LUACxj9ozJvvxfcZ7S+JmKR5ub
	v5neI8n7fZJjv9wWY2/Vf8T5qnoIn8G3Hq+0Hj9S7mQ==
X-Received: by 2002:a37:f605:: with SMTP id y5mr2957968qkj.288.1573134659995; 
	Thu, 07 Nov 2019 05:50:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwR0XN8Xkg7npgZmypT2TC+6FrvcOeN+9aUQy/VsChc7srS+8pQqGTXKUbO8NQlTjtab+Vs0A==
X-Received: by 2002:a37:f605:: with SMTP id y5mr2957932qkj.288.1573134659680; 
	Thu, 07 Nov 2019 05:50:59 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
	by smtp.gmail.com with ESMTPSA id
	p3sm1052072qkf.107.2019.11.07.05.50.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 05:50:58 -0800 (PST)
Date: Thu, 7 Nov 2019 08:50:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
Message-ID: <20191107085013-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
	<20191106133531.693-7-jasowang@redhat.com>
	<20191107040700-mutt-send-email-mst@kernel.org>
	<bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
	<20191107061942-mutt-send-email-mst@kernel.org>
	<d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
	<20191107080834-mutt-send-email-mst@kernel.org>
	<b2265e3a-6f86-c21a-2ebd-d0e4eea2886f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2265e3a-6f86-c21a-2ebd-d0e4eea2886f@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6MzI6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzExLzcg5LiL5Y2IOTowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6NDM6MjlQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS8xMS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNjoxODo0NVBNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAxOS8xMS83IOS4i+WNiDU6MDgsIE1p
Y2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkg
YXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBUaGlz
IHNhbXBsZSBkcml2ZXIgY3JlYXRlcyBtZGV2IGRldmljZSB0aGF0IHNpbXVsYXRlIHZpcnRpbyBu
ZXQgZGV2aWNlCj4gPiA+ID4gPiA+ID4gb3ZlciB2aXJ0aW8gbWRldiB0cmFuc3BvcnQuIFRoZSBk
ZXZpY2UgaXMgaW1wbGVtZW50ZWQgdGhyb3VnaCB2cmluZ2gKPiA+ID4gPiA+ID4gPiBhbmQgd29y
a3F1ZXVlLiBBIGRldmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMg
dXNlZAo+ID4gPiA+ID4gPiA+IGRpcmVjdGx5IGFzIHRoZSBJT1ZBLiBUaGlzIHNob3VsZCBiZSBz
dWZmaWNpZW50IGZvciBrZXJuZWwgdmlydGlvCj4gPiA+ID4gPiA+ID4gZHJpdmVyIHRvIHdvcmsu
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBv
cnRlZCByaWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4gPiA+ID4gPiA+ID4g
b24gdG9wIHdoaWNoIHJlcXVpcmVzIHNvbWUgdmlydHVhbCBJT01NVSBpbXBsZW1lbnRlZCBpbiB0
aGlzIHNhbXBsZQo+ID4gPiA+ID4gPiA+IGRyaXZlci4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiBBY2tlZC1ieTogQ29ybmVsaWEgSHVjazxjb2h1Y2tAcmVkaGF0LmNvbT4KPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+
ID4gPiA+IEknZCBwcmVmZXIgaXQgdGhhdCB3ZSBjYWxsIHRoaXMgc29tZXRoaW5nIGVsc2UsIGUu
Zy4KPiA+ID4gPiA+ID4gbXZuZXQtbG9vcGJhY2suIEp1c3Qgc28gcGVvcGxlIGRvbid0IGV4cGVj
dCBhIGZ1bGx5Cj4gPiA+ID4gPiA+IGZ1bmN0aW9uYWwgZGV2aWNlIHNvbWVob3cuIENhbiBiZSBy
ZW5hbWVkIHdoZW4gYXBwbHlpbmc/Cj4gPiA+ID4gPiBBY3R1YWxseSwgSSBwbGFuIHRvIGV4dGVu
ZCBpdCBhcyBhbm90aGVyIHN0YW5kYXJkIG5ldHdvcmsgaW50ZXJmYWNlIGZvcgo+ID4gPiA+ID4g
a2VybmVsLiBJdCBjb3VsZCBiZSBlaXRoZXIgYSBzdGFuZGFsb25lIHBzZXVkbyBkZXZpY2Ugb3Ig
YSBzdGFjayBkZXZpY2UuCj4gPiA+ID4gPiBEb2VzIHRoaXMgc291bmRzIGdvb2QgdG8geW91Pwo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiBUaGF0J3MgYSBiaWcgY2hhbmdlIGlu
IGFuIGludGVyZmFjZSBzbyBpdCdzIGEgZ29vZCByZWFzb24KPiA+ID4gPiB0byByZW5hbWUgdGhl
IGRyaXZlciBhdCB0aGF0IHBvaW50IHJpZ2h0Pwo+ID4gPiA+IE9oZXJ3aXNlIHVzZXJzIG9mIGFu
IG9sZCBrZXJuZWwgd291bGQgZXhwZWN0IGEgc3RhY2tlZCBkcml2ZXIKPiA+ID4gPiBhbmQgZ2V0
IGEgbG9vcGJhY2sgaW5zdGVhZC4KPiA+ID4gPiAKPiA+ID4gPiBPciBkaWQgSSBtaXNzIHNvbWV0
aGluZz8KPiA+ID4gCj4gPiA+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBpdCB3YXMgYSBzYW1w
bGUgZHJpdmVyIGluIC9kb2MuIEl0IHNob3VsZCBub3QgYmUKPiA+ID4gdXNlZCBpbiBwcm9kdWN0
aW9uIGVudmlyb25tZW50LiBPdGhlcndpc2Ugd2UgbmVlZCB0byBtb3ZlIGl0IHRvCj4gPiA+IGRy
aXZlci92aXJ0aW8uCj4gPiA+IAo+ID4gPiBCdXQgaWYgeW91IGluc2lzdCwgSSBjYW4gcG9zdCBh
IFYxMS4KPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gdGhpcyBjYW4gYmUgYSBwYXRjaCBvbiB0b3Au
Cj4gCj4gCj4gVGhlbiBtYXliZSBpdCdzIGJldHRlciBqdXN0IGV4dGVuZCBpdCB0byB3b3JrIGFz
IGEgbm9ybWFsIG5ldHdvcmtpbmcgZGV2aWNlCj4gb24gdG9wPwo+IAo+IFRoYW5rcwoKVGhhdCB3
b3VsZCBiZSBhIHN1YnN0YW50aWFsIGNoYW5nZS4gTWF5YmUgZHJvcCA2LzYgZm9yIG5vdyB1bnRp
bAp3ZSBoYXZlIGEgYmV0dGVyIGhhbmRsZSBvbiB0aGlzPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
