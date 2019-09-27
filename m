Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB6C028A
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 11:41:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6FB6D116C;
	Fri, 27 Sep 2019 09:41:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0F97AC8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:41:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 954431C0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:41:14 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1249E4FCD9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:41:14 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id x25so5202763qtq.2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 02:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=hwNSPFXYcjt0ijpRdc1M38OvqU5g9p5x1VDMj8NBIGI=;
	b=WExdWc2IwiRnfBsfKlQhmZs1q1hYudmSzoPa2xsRmEFWPjpq76E2P3p25N02tTQus1
	QX+XrmJtz4pgnmbJRoxYHApjwoYn7/skgfaE+620ul1udaJw8xd8NvyU1sCO5L/0utFF
	hYdN7BbUQJ1yWP5/qO4BdPi5fRKYsejG1U9LRygdXyPxYKknyDkD/m0KP52xuv3oPN3J
	CId03iyvncyyY9InwSXItm5T/EZaQfkOwlHdUQCVsv8TY2IaDWawC7dxy/Nu5G/WIVV0
	dkPalmhpa83PUpI0GT0zWTaNACtbZCVNXFCY6slHd/pf3H/Yj5c5hLCU8EGSPf91eDcf
	/6GA==
X-Gm-Message-State: APjAAAUiRumfsDHcOZK7L3XYG9+XIacbf1DBwpWkkC6PVRx6n9r3f2O3
	zqQcwmU/yla9/qfkYnJkmPXuqBsYPxNEhRQv9z95BgWNRhbw88TK3krhRgohk/sHekA12vX9qg8
	ZTguNvMsfTDDwalMo0XIiz6w3N+XL0a9nRbUbzIKY7A==
X-Received: by 2002:a37:aac8:: with SMTP id t191mr3503369qke.325.1569577273342;
	Fri, 27 Sep 2019 02:41:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/89V+twr9hPNLSOQXPg0tKZiJPuTDeybpYPFwNhDmewmUrIv8Fs6bzVi79PPZFA45J2U/tg==
X-Received: by 2002:a37:aac8:: with SMTP id t191mr3503317qke.325.1569577272663;
	Fri, 27 Sep 2019 02:41:12 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	v26sm3013791qta.88.2019.09.27.02.41.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 02:41:11 -0700 (PDT)
Date: Fri, 27 Sep 2019 05:41:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190927053935-mutt-send-email-mst@kernel.org>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
	<8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, lingshan.zhu@intel.com
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6Mjc6MTJBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMjYg5LiL5Y2IOToxNCwgVGl3ZWkgQmllIHdyb3RlOgo+ID4gT24g
VGh1LCBTZXAgMjYsIDIwMTkgYXQgMDQ6MzU6MThBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+ID4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAxMjo1NDoyN1BNICswODAwLCBU
aXdlaSBCaWUgd3JvdGU6Cj4gPiBbLi4uXQo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Vh
cGkvbGludXgvdmhvc3QuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiA+ID4gaW5k
ZXggNDBkMDI4ZWVkNjQ1Li41YWZiYzJmMDhmYTMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L3Zob3N0LmgKPiA+ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmhv
c3QuaAo+ID4gPiA+IEBAIC0xMTYsNCArMTE2LDEyIEBACj4gPiA+ID4gICAjZGVmaW5lIFZIT1NU
X1ZTT0NLX1NFVF9HVUVTVF9DSUQJX0lPVyhWSE9TVF9WSVJUSU8sIDB4NjAsIF9fdTY0KQo+ID4g
PiA+ICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfUlVOTklORwkJX0lPVyhWSE9TVF9WSVJUSU8s
IDB4NjEsIGludCkKPiA+ID4gPiArLyogVkhPU1RfTURFViBzcGVjaWZpYyBkZWZpbmVzICovCj4g
PiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZfU0VUX1NUQVRFCV9JT1coVkhPU1Rf
VklSVElPLCAweDcwLCBfX3U2NCkKPiA+ID4gPiArCj4gPiA+ID4gKyNkZWZpbmUgVkhPU1RfTURF
Vl9TX1NUT1BQRUQJMAo+ID4gPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZfU19SVU5OSU5HCTEKPiA+
ID4gPiArI2RlZmluZSBWSE9TVF9NREVWX1NfTUFYCTIKPiA+ID4gPiArCj4gPiA+ID4gICAjZW5k
aWYKPiA+ID4gU28gYXNzdW1pbmcgd2UgaGF2ZSBhbiB1bmRlcmx5aW5nIGRldmljZSB0aGF0IGJl
aGF2ZXMgbGlrZSB2aXJ0aW86Cj4gPiBJIHRoaW5rIHRoZXkgYXJlIHJlYWxseSBnb29kIHF1ZXN0
aW9ucy9zdWdnZXN0aW9ucy4gVGhhbmtzIQo+ID4gCj4gPiA+IDEuIFNob3VsZCB3ZSB1c2UgU0VU
X1NUQVRVUyBtYXliZT8KPiA+IEkgbGlrZSB0aGlzIGlkZWEuIEkgd2lsbCBnaXZlIGl0IGEgdHJ5
Lgo+ID4gCj4gPiA+IDIuIERvIHdlIHdhbnQgYSByZXNldCBpb2N0bD8KPiA+IEkgdGhpbmsgaXQg
aXMgaGVscGZ1bC4gSWYgd2UgdXNlIFNFVF9TVEFUVVMsIG1heWJlIHdlCj4gPiBjYW4gdXNlIGl0
IHRvIHN1cHBvcnQgdGhlIHJlc2V0Lgo+ID4gCj4gPiA+IDMuIERvIHdlIHdhbnQgYWJpbGl0eSB0
byBlbmFibGUgcmluZ3MgaW5kaXZpZHVhbGx5Pwo+ID4gSSB3aWxsIG1ha2UgaXQgcG9zc2libGUg
YXQgbGVhc3QgaW4gdGhlIHZob3N0IGxheWVyLgo+IAo+IAo+IE5vdGUgdGhlIEFQSSBzdXBwb3J0
IGUuZyBzZXRfdnFfcmVhZHkoKS4KCnZpcnRpbyBzcGVjIGNhbGxzIHRoaXMgImVuYWJsZWQiIHNv
IGxldCdzIHN0aWNrIHRvIHRoYXQuCgo+IAo+ID4gCj4gPiA+IDQuIERvZXMgZGV2aWNlIG5lZWQg
dG8gbGltaXQgbWF4IHJpbmcgc2l6ZT8KPiA+ID4gNS4gRG9lcyBkZXZpY2UgbmVlZCB0byBsaW1p
dCBtYXggbnVtYmVyIG9mIHF1ZXVlcz8KPiA+IEkgdGhpbmsgc28uIEl0J3MgaGVscGZ1bCB0byBo
YXZlIGlvY3RscyB0byByZXBvcnQgdGhlIG1heAo+ID4gcmluZyBzaXplIGFuZCBtYXggbnVtYmVy
IG9mIHF1ZXVlcy4KPiAKPiAKPiBBbiBpc3N1ZSBpcyB0aGUgbWF4IG51bWJlciBvZiBxdWV1ZXMg
aXMgZG9uZSB0aHJvdWdoIGEgZGV2aWNlIHNwZWNpZmljIHdheSwKPiB1c3VhbGx5IGRldmljZSBj
b25maWd1cmF0aW9uIHNwYWNlLiBUaGlzIGlzIHN1cHBvcnRlZCBieSB0aGUgdHJhbnNwb3J0IEFQ
SSwKPiBidXQgaG93IHRvIGV4cG9zZSBpdCB0byB1c2Vyc3BhY2UgbWF5IG5lZWQgbW9yZSB0aG91
Z2h0Lgo+IAo+IFRoYW5rcwoKYW4gaW9jdGwgZm9yIGRldmljZSBjb25maWc/ICBCdXQgZm9yIHYx
IEknZCBiZSBxdWl0ZSBoYXBweSB0byBqdXN0IGhhdmUKYSBtaW5pbWFsIHdvcmtpbmcgZGV2aWNl
IHdpdGggMiBxdWV1ZXMuCgo+IAo+ID4gCj4gPiBUaGFua3MhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
