Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF8C0572
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 14:46:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A79BAFF9;
	Fri, 27 Sep 2019 12:46:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 30D29FF0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 12:46:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B96EF1C0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 12:46:39 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9FAE19D381
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 12:46:38 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id k67so2498395qkc.3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 05:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=F0AJjiYSseSar3j8FYQBkm/uGwjn3oyXe7/oWdhrCrA=;
	b=XmhifrVtILm54kGDMzHASY7L90GD9GJcSv1hdko+7jzms6sCC/pg6VIiIqxgiwB48U
	lPI8JPTaAYU8KkLPbM6tthVXPZMoyiHtu5AyeQ4nyV9qMm4qnQEM6kiOmSDBtlVYocKD
	6BI+G+4Jb8VP2xtySjWSyqUPlo/v+nYIKnSEtWvsw1B4sG32IK0FwFSGQGdsYaPFuW/u
	2z/mYm2LVcYQKKcFSOGT7OAAS9cw7f8ClyvRY3JtvRihGG8E8awXiN1ecrnswwMsoxui
	Z+Tr4e8Yl/yKRgpayLIlerNDaTYaCteujmIQ71zfu1x6dghQgWgTO0N1uu/nZGqQ1XaL
	AswQ==
X-Gm-Message-State: APjAAAUmqNFfAzQtEZhMXmRFrpb7Pe71HouVXHSM//MH0zO9+VtWNafY
	gDxPzCBGlcUdgTAaptulADGe/isSIEehnCQ2epHCdDiuSdP4iYsEzY8zDUOeIXyT0iLUFpLazLM
	3zasOe3P0KOKqdz+G7hO4oOCwgGxPrQ9rI/SztgUmew==
X-Received: by 2002:ac8:4799:: with SMTP id k25mr7997678qtq.367.1569588398248; 
	Fri, 27 Sep 2019 05:46:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAFgv2zv7Du3HbBGPrbXCj+OH0ccwA9kLx7oS6JvyRcdhReSO32VIYn0OwwDZ4C1U+jtQ3wA==
X-Received: by 2002:ac8:4799:: with SMTP id k25mr7997659qtq.367.1569588398060; 
	Fri, 27 Sep 2019 05:46:38 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id q2sm1095503qkc.68.2019.09.27.05.46.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 05:46:37 -0700 (PDT)
Date: Fri, 27 Sep 2019 08:46:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190927084408-mutt-send-email-mst@kernel.org>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
	<8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
	<20190927053935-mutt-send-email-mst@kernel.org>
	<a959fe1e-3095-e0f0-0c9b-57f6eaa9c8b7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a959fe1e-3095-e0f0-0c9b-57f6eaa9c8b7@redhat.com>
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDg6MTc6NDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMjcg5LiL5Y2INTo0MSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6Mjc6MTJBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS85LzI2IOS4i+WNiDk6MTQsIFRpd2VpIEJpZSB3cm90ZToK
PiA+ID4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAwNDozNToxOEFNIC0wNDAwLCBNaWNoYWVs
IFMuIFRzaXJraW4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAxMjo1
NDoyN1BNICswODAwLCBUaXdlaSBCaWUgd3JvdGU6Cj4gPiA+ID4gWy4uLl0KPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L3Zob3N0LmgKPiA+ID4gPiA+ID4gaW5kZXggNDBkMDI4ZWVkNjQ1Li41YWZiYzJmMDhmYTMg
MTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiA+
ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiA+ID4gPiA+IEBAIC0x
MTYsNCArMTE2LDEyIEBACj4gPiA+ID4gPiA+ICAgICNkZWZpbmUgVkhPU1RfVlNPQ0tfU0VUX0dV
RVNUX0NJRAlfSU9XKFZIT1NUX1ZJUlRJTywgMHg2MCwgX191NjQpCj4gPiA+ID4gPiA+ICAgICNk
ZWZpbmUgVkhPU1RfVlNPQ0tfU0VUX1JVTk5JTkcJCV9JT1coVkhPU1RfVklSVElPLCAweDYxLCBp
bnQpCj4gPiA+ID4gPiA+ICsvKiBWSE9TVF9NREVWIHNwZWNpZmljIGRlZmluZXMgKi8KPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiArI2RlZmluZSBWSE9TVF9NREVWX1NFVF9TVEFURQlfSU9XKFZI
T1NUX1ZJUlRJTywgMHg3MCwgX191NjQpCj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyNkZWZp
bmUgVkhPU1RfTURFVl9TX1NUT1BQRUQJMAo+ID4gPiA+ID4gPiArI2RlZmluZSBWSE9TVF9NREVW
X1NfUlVOTklORwkxCj4gPiA+ID4gPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZfU19NQVgJMgo+ID4g
PiA+ID4gPiArCj4gPiA+ID4gPiA+ICAgICNlbmRpZgo+ID4gPiA+ID4gU28gYXNzdW1pbmcgd2Ug
aGF2ZSBhbiB1bmRlcmx5aW5nIGRldmljZSB0aGF0IGJlaGF2ZXMgbGlrZSB2aXJ0aW86Cj4gPiA+
ID4gSSB0aGluayB0aGV5IGFyZSByZWFsbHkgZ29vZCBxdWVzdGlvbnMvc3VnZ2VzdGlvbnMuIFRo
YW5rcyEKPiA+ID4gPiAKPiA+ID4gPiA+IDEuIFNob3VsZCB3ZSB1c2UgU0VUX1NUQVRVUyBtYXli
ZT8KPiA+ID4gPiBJIGxpa2UgdGhpcyBpZGVhLiBJIHdpbGwgZ2l2ZSBpdCBhIHRyeS4KPiA+ID4g
PiAKPiA+ID4gPiA+IDIuIERvIHdlIHdhbnQgYSByZXNldCBpb2N0bD8KPiA+ID4gPiBJIHRoaW5r
IGl0IGlzIGhlbHBmdWwuIElmIHdlIHVzZSBTRVRfU1RBVFVTLCBtYXliZSB3ZQo+ID4gPiA+IGNh
biB1c2UgaXQgdG8gc3VwcG9ydCB0aGUgcmVzZXQuCj4gPiA+ID4gCj4gPiA+ID4gPiAzLiBEbyB3
ZSB3YW50IGFiaWxpdHkgdG8gZW5hYmxlIHJpbmdzIGluZGl2aWR1YWxseT8KPiA+ID4gPiBJIHdp
bGwgbWFrZSBpdCBwb3NzaWJsZSBhdCBsZWFzdCBpbiB0aGUgdmhvc3QgbGF5ZXIuCj4gPiA+IAo+
ID4gPiBOb3RlIHRoZSBBUEkgc3VwcG9ydCBlLmcgc2V0X3ZxX3JlYWR5KCkuCj4gPiB2aXJ0aW8g
c3BlYyBjYWxscyB0aGlzICJlbmFibGVkIiBzbyBsZXQncyBzdGljayB0byB0aGF0Lgo+IAo+IAo+
IE9rLgo+IAo+IAo+ID4gCj4gPiA+ID4gPiA0LiBEb2VzIGRldmljZSBuZWVkIHRvIGxpbWl0IG1h
eCByaW5nIHNpemU/Cj4gPiA+ID4gPiA1LiBEb2VzIGRldmljZSBuZWVkIHRvIGxpbWl0IG1heCBu
dW1iZXIgb2YgcXVldWVzPwo+ID4gPiA+IEkgdGhpbmsgc28uIEl0J3MgaGVscGZ1bCB0byBoYXZl
IGlvY3RscyB0byByZXBvcnQgdGhlIG1heAo+ID4gPiA+IHJpbmcgc2l6ZSBhbmQgbWF4IG51bWJl
ciBvZiBxdWV1ZXMuCj4gPiA+IAo+ID4gPiBBbiBpc3N1ZSBpcyB0aGUgbWF4IG51bWJlciBvZiBx
dWV1ZXMgaXMgZG9uZSB0aHJvdWdoIGEgZGV2aWNlIHNwZWNpZmljIHdheSwKPiA+ID4gdXN1YWxs
eSBkZXZpY2UgY29uZmlndXJhdGlvbiBzcGFjZS4gVGhpcyBpcyBzdXBwb3J0ZWQgYnkgdGhlIHRy
YW5zcG9ydCBBUEksCj4gPiA+IGJ1dCBob3cgdG8gZXhwb3NlIGl0IHRvIHVzZXJzcGFjZSBtYXkg
bmVlZCBtb3JlIHRob3VnaHQuCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+IGFuIGlvY3RsIGZvciBk
ZXZpY2UgY29uZmlnPyAgQnV0IGZvciB2MSBJJ2QgYmUgcXVpdGUgaGFwcHkgdG8ganVzdCBoYXZl
Cj4gPiBhIG1pbmltYWwgd29ya2luZyBkZXZpY2Ugd2l0aCAyIHF1ZXVlcy4KPiAKPiAKPiBJJ20g
ZnVsbHkgYWdyZWUsIGFuZCBpdCB3aWxsIHdvcmsgYXMgbG9uZyBhcyBWSVJUSU9fTkVUX0ZfTVEg
YW5kCj4gVklSVElPX05FVF9GX0NUUkxfVlEgaXMgbm90IGFkdmVydGlzZWQgYnkgdGhlIG1kZXYg
ZGV2aWNlLgo+IAo+IFRoYW5rcwoKSG1tIHRoaXMgbWVhbnMgd2UgbmVlZCB0byB2YWxpZGF0ZSB0
aGUgZmVhdHVyZXMgYml0cywKbm90IGp1c3QgcGFzcyB0aGVtIHRocm91Z2ggdG8gdGhlIGhhcmR3
YXJlLgpQcm9ibGVtIGlzLCBob3cgZG8gd2UgYWRkIG1vcmUgZmVhdHVyZSBiaXRzIGxhdGVyLAp3
aXRob3V0IHRlc3RpbmcgYWxsIGhhcmR3YXJlPwpJIGd1ZXNzIHRoaXMgbWVhbnMgdGhlIGRldmlj
ZSBzcGVjaWZpYyBkcml2ZXIgbXVzdCBkbyBpdC4KCgo+IAo+ID4gCj4gPiA+ID4gVGhhbmtzIQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
