Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 15030ADB61
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 16:45:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D45BAF94;
	Mon,  9 Sep 2019 14:45:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0B65BF7A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 14:45:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9990082B
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 14:45:15 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06F797BDD1
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 14:45:15 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id d10so4030294wmb.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 09 Sep 2019 07:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=TIU8l9uNtqi5N363chjsQODAD8NExttwuYVEnSx0c3k=;
	b=ADZHlbTyqZehrtKylSi+eW1Md0MLWY7TXgVvs7G2xrXfScFjMxVRtEFUs3I5WeK5jo
	jg36isiEFohDDk+qqrwi0vdmJM8YtbPs21QHEgyR8Fu5x0srfkV2Midb+7rqL8aF7TDZ
	Br4xGNCgW8A6iv+USXfHU0NMDXwXRGTu5di/KN5OGWlf3m6rRWUkuw1oYbAXDXAxASK8
	+Q/HFgN4c6xr8MSYSmtYarcsp5FAarMxeHU3hZu3Qnv5Sr4r2zA1mMu/0768oCD3GI0J
	PJHy7BVnzvz+/Ba+THJv8zA4qhhgEBtmnMz/wtwWLgJzv08xxOy6tFHkyYJDbAtyOBTU
	7daA==
X-Gm-Message-State: APjAAAUiP7j4CBGrkT04jPUwOdJWIG5uYSDt/cWljYla5qL4GPLAcBON
	kMH2PTbmLKDYphRCH0B2Wi2+r9xoQgZWOROusiWOUqj3wA3hWcBHLPpnDETRr5mHIJE8TqVoZnW
	Ji8545eUheHBk5iWrbgsI7GnzJfc5ZvxM1NlE4ujraw==
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr12031967wrn.121.1568040313765;
	Mon, 09 Sep 2019 07:45:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcqag+ERBvSjIm6CpVOwAwyVlX8Vd50VjCvuAgwQi1q8tVVx/gSm4B5gLVsG6xNkiMwg2Qkg==
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr12031946wrn.121.1568040313584;
	Mon, 09 Sep 2019 07:45:13 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	y14sm26560796wrd.84.2019.09.09.07.45.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 07:45:12 -0700 (PDT)
Date: Mon, 9 Sep 2019 10:45:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH untested] vhost: block speculation of translated
	descriptors
Message-ID: <20190909104355-mutt-send-email-mst@kernel.org>
References: <20190908110521.4031-1-mst@redhat.com>
	<db4d77d7-c467-935d-b4ae-1da7635e9b6b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db4d77d7-c467-935d-b4ae-1da7635e9b6b@redhat.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDM6MTk6NTVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvOCDkuIvljYg3OjA1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBpb3ZlYyBhZGRyZXNzZXMgY29taW5nIGZyb20gdmhvc3QgYXJlIGFzc3VtZWQgdG8gYmUK
PiA+IHByZS12YWxpZGF0ZWQsIGJ1dCBpbiBmYWN0IGNhbiBiZSBzcGVjdWxhdGVkIHRvIGEgdmFs
dWUKPiA+IG91dCBvZiByYW5nZS4KPiA+IAo+ID4gVXNlcnNwYWNlIGFkZHJlc3MgYXJlIGxhdGVy
IHZhbGlkYXRlZCB3aXRoIGFycmF5X2luZGV4X25vc3BlYyBzbyB3ZSBjYW4KPiA+IGJlIHN1cmUg
a2VybmVsIGluZm8gZG9lcyBub3QgbGVhayB0aHJvdWdoIHRoZXNlIGFkZHJlc3NlcywgYnV0IHZo
b3N0Cj4gPiBtdXN0IGFsc28gbm90IGxlYWsgdXNlcnNwYWNlIGluZm8gb3V0c2lkZSB0aGUgYWxs
b3dlZCBtZW1vcnkgdGFibGUgdG8KPiA+IGd1ZXN0cy4KPiA+IAo+ID4gRm9sbG93aW5nIHRoZSBk
ZWZlbmNlIGluIGRlcHRoIHByaW5jaXBsZSwgbWFrZSBzdXJlCj4gPiB0aGUgYWRkcmVzcyBpcyBu
b3QgdmFsaWRhdGVkIG91dCBvZiBub2RlIHJhbmdlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
dmhvc3Qvdmhvc3QuYyB8IDQgKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zo
b3N0LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiA+IGluZGV4IDVkYzE3NGFjOGNhYy4uMGVl
Mzc1ZmI3MTQ1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gPiArKysg
Yi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiA+IEBAIC0yMDcyLDcgKzIwNzIsOSBAQCBzdGF0aWMg
aW50IHRyYW5zbGF0ZV9kZXNjKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLCB1NjQgYWRkciwg
dTMyIGxlbiwKPiA+ICAgCQlzaXplID0gbm9kZS0+c2l6ZSAtIGFkZHIgKyBub2RlLT5zdGFydDsK
PiA+ICAgCQlfaW92LT5pb3ZfbGVuID0gbWluKCh1NjQpbGVuIC0gcywgc2l6ZSk7Cj4gPiAgIAkJ
X2lvdi0+aW92X2Jhc2UgPSAodm9pZCBfX3VzZXIgKikodW5zaWduZWQgbG9uZykKPiA+IC0JCQko
bm9kZS0+dXNlcnNwYWNlX2FkZHIgKyBhZGRyIC0gbm9kZS0+c3RhcnQpOwo+ID4gKwkJCShub2Rl
LT51c2Vyc3BhY2VfYWRkciArCj4gPiArCQkJIGFycmF5X2luZGV4X25vc3BlYyhhZGRyIC0gbm9k
ZS0+c3RhcnQsCj4gPiArCQkJCQkgICAgbm9kZS0+c2l6ZSkpOwo+ID4gICAJCXMgKz0gc2l6ZTsK
PiA+ICAgCQlhZGRyICs9IHNpemU7Cj4gPiAgIAkJKytyZXQ7Cj4gCj4gCj4gSSd2ZSB0cmllZCB0
aGlzIG9uIEthYnkgTGFrZSBzbWFwIG9mZiBtZXRhZGF0YSBhY2NlbGVyYXRpb24gb2ZmIHVzaW5n
Cj4gdGVzdHBtZCAodmlydGlvLXVzZXIpICsgdmhvc3RfbmV0LiBJIGRvbid0IHNlZSBvYnZpb3Vz
IHBlcmZvcm1hbmNlCj4gZGlmZmVyZW5jZSB3aXRoIFRYIFBQUy4KPiAKPiBUaGFua3MKClNob3Vs
ZCBJIHB1c2ggdGhpcyB0byBMaW51cyByaWdodCBub3cgdGhlbj8gSXQncyBhIHNlY3VyaXR5IHRo
aW5nIHNvCm1heWJlIHdlIGJldHRlciBkbyBpdCBBU0FQIC4uLiB3aGF0J3MgeW91ciBvcGluaW9u
PwoKLS0gCk1TVApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
