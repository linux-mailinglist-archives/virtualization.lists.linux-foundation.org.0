Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5FC063B
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 15:24:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A9538103B;
	Fri, 27 Sep 2019 13:23:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F5C91028
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:23:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CA28E8C8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:23:55 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 394B4756
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:23:55 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id w198so2617986qka.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 06:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=AyTMKGoGs/Lkq3kyZ5E07Ek1WWcR6PtX7h75NGzXR98=;
	b=IRjUoQzM8n2bRuQHmqlsp0jYYqsLjDIdBQ71EZsTqfJyqbKXYgZ3tsOH+fg13RcFp0
	wL/eMG4tbIfxaVeSdSQU6Z7H5KDBajd1yWcBVmb+nlug7naQazc7/QY3nC9SBwfMHGeW
	f3gPWYfQUnIPZjy9PdZPwyJ/yew7f4aDNNDBwyDz5Xvf38sUjxsPJWxS7GbF9GzxhSb9
	ycdRTSdWu1+zxBJjMQgSfnmsbTmRvAqXniOij3ildLACPenzKcqCN7pvt8iOCxtm3zCr
	3AeoH1EXoB/9iwdFjFYYZWePR4V6GfpTK5L1DQNX0rXIHyDEfKEO05CIGYBecxiat+rM
	r2BQ==
X-Gm-Message-State: APjAAAWACWyI5tQFIItg59s3jNU/ZlWywSRhxYzCiztHzcbcMlKoWF9n
	FfxN9T8yT3sQaXLC9bSY2XvWnYrjvGTR5xy5XL8cVp1ANJ6ZfSuYVB36gfZrlEZ+V7EVp0gTNk7
	dvC4ekiBN8Q4ynw334aOW40Fe6kpwOOQOM0CrV7MfTA==
X-Received: by 2002:ae9:ebcc:: with SMTP id b195mr4157309qkg.387.1569590634432;
	Fri, 27 Sep 2019 06:23:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyd11e5rCRWe0bxFf6zGmoFapNlaYtDWeIQ/2TfJmDkfR/AHi55ZmXJPrcHHDUd2jtkidxpVA==
X-Received: by 2002:ae9:ebcc:: with SMTP id b195mr4157280qkg.387.1569590634189;
	Fri, 27 Sep 2019 06:23:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	m14sm1073230qki.27.2019.09.27.06.23.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 06:23:52 -0700 (PDT)
Date: Fri, 27 Sep 2019 09:23:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190927092219-mutt-send-email-mst@kernel.org>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
	<8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
	<20190927053935-mutt-send-email-mst@kernel.org>
	<a959fe1e-3095-e0f0-0c9b-57f6eaa9c8b7@redhat.com>
	<20190927084408-mutt-send-email-mst@kernel.org>
	<b6f6ffb2-0b16-5041-be2e-94b805c6a4c9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6f6ffb2-0b16-5041-be2e-94b805c6a4c9@redhat.com>
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDk6MTc6NTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMjcg5LiL5Y2IODo0NiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDg6MTc6NDdQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS85LzI3IOS4i+WNiDU6NDEsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBGcmksIFNlcCAyNywgMjAxOSBhdCAxMToyNzoxMkFNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAxOS85LzI2IOS4i+WNiDk6MTQsIFRp
d2VpIEJpZSB3cm90ZToKPiA+ID4gPiA+ID4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDQ6MzU6
MThBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIFRo
dSwgU2VwIDI2LCAyMDE5IGF0IDEyOjU0OjI3UE0gKzA4MDAsIFRpd2VpIEJpZSB3cm90ZToKPiA+
ID4gPiA+ID4gWy4uLl0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
bGludXgvdmhvc3QuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiA+ID4gPiA+ID4g
PiBpbmRleCA0MGQwMjhlZWQ2NDUuLjVhZmJjMmYwOGZhMyAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+
IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiA+ID4gPiA+ID4gPiArKysgYi9p
bmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+ID4gPiA+ID4gPiA+ID4gQEAgLTExNiw0ICsxMTYs
MTIgQEAKPiA+ID4gPiA+ID4gPiA+ICAgICAjZGVmaW5lIFZIT1NUX1ZTT0NLX1NFVF9HVUVTVF9D
SUQJX0lPVyhWSE9TVF9WSVJUSU8sIDB4NjAsIF9fdTY0KQo+ID4gPiA+ID4gPiA+ID4gICAgICNk
ZWZpbmUgVkhPU1RfVlNPQ0tfU0VUX1JVTk5JTkcJCV9JT1coVkhPU1RfVklSVElPLCAweDYxLCBp
bnQpCj4gPiA+ID4gPiA+ID4gPiArLyogVkhPU1RfTURFViBzcGVjaWZpYyBkZWZpbmVzICovCj4g
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArI2RlZmluZSBWSE9TVF9NREVWX1NFVF9T
VEFURQlfSU9XKFZIT1NUX1ZJUlRJTywgMHg3MCwgX191NjQpCj4gPiA+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ID4gPiArI2RlZmluZSBWSE9TVF9NREVWX1NfU1RPUFBFRAkwCj4gPiA+ID4gPiA+
ID4gPiArI2RlZmluZSBWSE9TVF9NREVWX1NfUlVOTklORwkxCj4gPiA+ID4gPiA+ID4gPiArI2Rl
ZmluZSBWSE9TVF9NREVWX1NfTUFYCTIKPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+
ICAgICAjZW5kaWYKPiA+ID4gPiA+ID4gPiBTbyBhc3N1bWluZyB3ZSBoYXZlIGFuIHVuZGVybHlp
bmcgZGV2aWNlIHRoYXQgYmVoYXZlcyBsaWtlIHZpcnRpbzoKPiA+ID4gPiA+ID4gSSB0aGluayB0
aGV5IGFyZSByZWFsbHkgZ29vZCBxdWVzdGlvbnMvc3VnZ2VzdGlvbnMuIFRoYW5rcyEKPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+ID4gMS4gU2hvdWxkIHdlIHVzZSBTRVRfU1RBVFVTIG1heWJlPwo+
ID4gPiA+ID4gPiBJIGxpa2UgdGhpcyBpZGVhLiBJIHdpbGwgZ2l2ZSBpdCBhIHRyeS4KPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+ID4gMi4gRG8gd2Ugd2FudCBhIHJlc2V0IGlvY3RsPwo+ID4gPiA+
ID4gPiBJIHRoaW5rIGl0IGlzIGhlbHBmdWwuIElmIHdlIHVzZSBTRVRfU1RBVFVTLCBtYXliZSB3
ZQo+ID4gPiA+ID4gPiBjYW4gdXNlIGl0IHRvIHN1cHBvcnQgdGhlIHJlc2V0Lgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiAzLiBEbyB3ZSB3YW50IGFiaWxpdHkgdG8gZW5hYmxlIHJpbmdzIGlu
ZGl2aWR1YWxseT8KPiA+ID4gPiA+ID4gSSB3aWxsIG1ha2UgaXQgcG9zc2libGUgYXQgbGVhc3Qg
aW4gdGhlIHZob3N0IGxheWVyLgo+ID4gPiA+ID4gTm90ZSB0aGUgQVBJIHN1cHBvcnQgZS5nIHNl
dF92cV9yZWFkeSgpLgo+ID4gPiA+IHZpcnRpbyBzcGVjIGNhbGxzIHRoaXMgImVuYWJsZWQiIHNv
IGxldCdzIHN0aWNrIHRvIHRoYXQuCj4gPiA+IAo+ID4gPiBPay4KPiA+ID4gCj4gPiA+IAo+ID4g
PiA+ID4gPiA+IDQuIERvZXMgZGV2aWNlIG5lZWQgdG8gbGltaXQgbWF4IHJpbmcgc2l6ZT8KPiA+
ID4gPiA+ID4gPiA1LiBEb2VzIGRldmljZSBuZWVkIHRvIGxpbWl0IG1heCBudW1iZXIgb2YgcXVl
dWVzPwo+ID4gPiA+ID4gPiBJIHRoaW5rIHNvLiBJdCdzIGhlbHBmdWwgdG8gaGF2ZSBpb2N0bHMg
dG8gcmVwb3J0IHRoZSBtYXgKPiA+ID4gPiA+ID4gcmluZyBzaXplIGFuZCBtYXggbnVtYmVyIG9m
IHF1ZXVlcy4KPiA+ID4gPiA+IEFuIGlzc3VlIGlzIHRoZSBtYXggbnVtYmVyIG9mIHF1ZXVlcyBp
cyBkb25lIHRocm91Z2ggYSBkZXZpY2Ugc3BlY2lmaWMgd2F5LAo+ID4gPiA+ID4gdXN1YWxseSBk
ZXZpY2UgY29uZmlndXJhdGlvbiBzcGFjZS4gVGhpcyBpcyBzdXBwb3J0ZWQgYnkgdGhlIHRyYW5z
cG9ydCBBUEksCj4gPiA+ID4gPiBidXQgaG93IHRvIGV4cG9zZSBpdCB0byB1c2Vyc3BhY2UgbWF5
IG5lZWQgbW9yZSB0aG91Z2h0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiBh
biBpb2N0bCBmb3IgZGV2aWNlIGNvbmZpZz8gIEJ1dCBmb3IgdjEgSSdkIGJlIHF1aXRlIGhhcHB5
IHRvIGp1c3QgaGF2ZQo+ID4gPiA+IGEgbWluaW1hbCB3b3JraW5nIGRldmljZSB3aXRoIDIgcXVl
dWVzLgo+ID4gPiAKPiA+ID4gSSdtIGZ1bGx5IGFncmVlLCBhbmQgaXQgd2lsbCB3b3JrIGFzIGxv
bmcgYXMgVklSVElPX05FVF9GX01RIGFuZAo+ID4gPiBWSVJUSU9fTkVUX0ZfQ1RSTF9WUSBpcyBu
b3QgYWR2ZXJ0aXNlZCBieSB0aGUgbWRldiBkZXZpY2UuCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+
IEhtbSB0aGlzIG1lYW5zIHdlIG5lZWQgdG8gdmFsaWRhdGUgdGhlIGZlYXR1cmVzIGJpdHMsCj4g
PiBub3QganVzdCBwYXNzIHRoZW0gdGhyb3VnaCB0byB0aGUgaGFyZHdhcmUuCj4gPiBQcm9ibGVt
IGlzLCBob3cgZG8gd2UgYWRkIG1vcmUgZmVhdHVyZSBiaXRzIGxhdGVyLAo+ID4gd2l0aG91dCB0
ZXN0aW5nIGFsbCBoYXJkd2FyZT8KPiA+IEkgZ3Vlc3MgdGhpcyBtZWFucyB0aGUgZGV2aWNlIHNw
ZWNpZmljIGRyaXZlciBtdXN0IGRvIGl0Lgo+ID4gCj4gCj4gVGhhdCBsb29rcyBub3QgZ29vZCwg
bWF5YmUgYSB2aXJ0aW8gZGV2aWNlIGlkIGJhc2VkIGZlYXR1cmVzIGJsYWNrbGlzdCBpbgo+IHZo
b3N0LW1kZXYuIFRoZW4gTVEgYW5kIENUUkxfVlEgY291bGQgYmUgZmlsdGVyZWQgb3V0IGJ5IHZo
b3N0LW1kZXYuCj4gCj4gVGhhbmtzCgpUd28gaW1wbGVtZW50YXRpb25zIG9mIGUuZy4gdmlydGlv
IG5ldCBjYW4gaGF2ZSBkaWZmZXJlbnQKZmVhdHVyZXMgd2hpdGVsaXN0ZWQuIFNvIEkgdGhpbmsg
dGhlcmUncyBubyB3YXkgYnV0IGxldAp0aGUgZHJpdmVyIGRvIGl0LiBXZSBzaG91bGQgcHJvYmFi
bHkgcHJvdmlkZSBhIHN0YW5kYXJkIHBsYWNlCmluIHRoZSBvcHMgZm9yIGRyaXZlciB0byBzdXBw
bHkgdGhlIHdoaXRlbGlzdCwgdG8gbWFrZSBzdXJlCmRyaXZlcnMgZG9uJ3QgZm9yZ2V0LgoKPiAK
PiA+ID4gPiA+ID4gVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
