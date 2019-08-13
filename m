Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 609158B3FE
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:20:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2ED3DCB6;
	Tue, 13 Aug 2019 09:20:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 11210C96
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:20:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 667548A8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:20:50 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v15so819461wml.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5WhOyVWdh6QSPNAVErcAEqsYGeEW+/y9GXLU12kMFrw=;
	b=HN/NmRY93O6zOxnygC/RAnJdTSePkb0tSjM2By2In4ZCAYQLr//0jucBk2Gtmb774k
	QPrgk4jcMp3cnBSkZPb70gNzCELMubPQu19oHh+TkB8QR6gruEKYBX+7txvHWt6VcqWB
	rimHS/YPXdHWZGlgF737z7eYpMRXGxDBaTgzcqM+RBeK1EZKRs4EMRK1ijVnvyARcpgW
	2mYJCbKcOAUYK/djDvWityTP7rvj3wkRVRJvOdnRAeQykQw5/kD8zvKZJvWgT6ORn/4h
	1QzQIaRjj59Tvp2u8UArBrJDFvkPGB775LphKVkcmpftuS0OshfV/soTo52+OrzhVrdx
	LWCQ==
X-Gm-Message-State: APjAAAXfKwmrgZ2CmmTCqcrjhM4ydTqLH9lk9QiauGL2UV1h7j0c9a41
	QWR5135+lJW92TNJ4rfYZ/Tf5w==
X-Google-Smtp-Source: APXvYqy7ZmTsVWHpsqOXwbw3dSaP1W5TTiLRwJljDd+oxKVerUOBaX1bmIlseQ1dv51/PnYJUN17Cw==
X-Received: by 2002:a7b:c7c4:: with SMTP id z4mr1999804wmk.13.1565688048937;
	Tue, 13 Aug 2019 02:20:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d12:7fa9:fb2d:7edb?
	([2001:b07:6468:f312:5d12:7fa9:fb2d:7edb])
	by smtp.gmail.com with ESMTPSA id
	z6sm18721496wre.76.2019.08.13.02.20.46
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:20:48 -0700 (PDT)
Subject: Re: [RFC PATCH v6 74/92] kvm: x86: do not unconditionally patch the
	hypercall instruction during emulation
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-75-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1362cc5c-d0cd-6b7c-1151-9df3996fefa9@redhat.com>
Date: Tue, 13 Aug 2019 11:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-75-alazar@bitdefender.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C Zhang <yu.c.zhang@intel.com>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
	Joerg Roedel <joro@8bytes.org>
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

T24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBGcm9tOiBNaWhhaSBE
b27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+Cj4gCj4gSXQgY2FuIGhhcHBlbmVkIGZvciB1
cyB0byBlbmQgdXAgZW11bGF0aW5nIHRoZSBWTUNBTEwgaW5zdHJ1Y3Rpb24gYXMgYQo+IHJlc3Vs
dCBvZiB0aGUgaGFuZGxpbmcgb2YgYW4gRVBUIHdyaXRlIGZhdWx0LiBJbiB0aGlzIHNpdHVhdGlv
biwgdGhlCj4gZW11bGF0b3Igd2lsbCB0cnkgdG8gdW5jb25kaXRpb25hbGx5IHBhdGNoIHRoZSBj
b3JyZWN0IGh5cGVyY2FsbCBvcGNvZGUKPiBieXRlcyB1c2luZyBlbXVsYXRvcl93cml0ZV9lbXVs
YXRlZCgpLiBIb3dldmVyLCB0aGlzIGxhc3QgY2FsbCB1c2VzIHRoZQo+IGZhdWx0IEdQQSAoaWYg
YXZhaWxhYmxlKSBvciB3YWxrcyB0aGUgZ3Vlc3QgcGFnZSB0YWJsZXMgYXQgUklQLAo+IG90aGVy
d2lzZS4gVGhlIHRyb3VibGUgYmVnaW5zIHdoZW4gdXNpbmcgS1ZNSSwgd2hlbiB3ZSBmb3JiaWQg
dGhlIHVzZSBvZgo+IHRoZSBmYXVsdCBHUEEgYW5kIGZhbGxiYWNrIHRvIHRoZSBndWVzdCBwdCB3
YWxrOiBpbiBXaW5kb3dzICg4LjEgYW5kCj4gbmV3ZXIpIHRoZSBwYWdlIHRoYXQgd2UgdHJ5IHRv
IHdyaXRlIGludG8gaXMgbWFya2VkIHJlYWQtZXhlY3V0ZSBhbmQgYXMKPiBzdWNoIGVtdWxhdG9y
X3dyaXRlX2VtdWxhdGVkKCkgZmFpbHMgYW5kIHdlIGluamVjdCBhIHdyaXRlICNQRiwgbGVhZGlu
Zwo+IHRvIGEgZ3Vlc3QgY3Jhc2guCj4gCj4gVGhlIGZpeCBpcyByYXRoZXIgc2ltcGxlOiBjaGVj
ayB0aGUgZXhpc3RpbmcgaW5zdHJ1Y3Rpb24gYnl0ZXMgYmVmb3JlCj4gZG9pbmcgdGhlIHBhdGNo
aW5nLiBUaGlzIGRvZXMgbm90IGNoYW5nZSB0aGUgbm9ybWFsIEtWTSBiZWhhdmlvdXIsIGJ1dAo+
IGRvZXMgaGVscCB3aGVuIHVzaW5nIEtWTUkgYXMgd2Ugbm8gbG9uZ2VyIGluamVjdCBhIHdyaXRl
ICNQRi4KCkZpeGluZyB0aGUgaHlwZXJjYWxsIGlzIGp1c3QgYW4gb3B0aW1pemF0aW9uLiAgQ2Fu
IHdlIGp1c3QgaHVzaCBhbmQKcmV0dXJuIHRvIHRoZSBndWVzdCBpZiBlbXVsYXRvcl93cml0ZV9l
bXVsYXRlZCByZXR1cm5zClg4NkVNVUxfUFJPUEFHQVRFX0ZBVUxUPwoKUGFvbG8KCj4gQ0M6IEpv
ZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsib
dSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrE
g3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Cj4gLS0tCj4gIGFyY2gveDg2L2t2bS94ODYuYyB8
IDIzICsrKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2
LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKPiBpbmRleCAwNGIxZDI5MTZhMGEuLjk2NWM0ZjAxMDhl
YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKPiArKysgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMKPiBAQCAtNzM2MywxNiArNzM2MywzMyBAQCBpbnQga3ZtX2VtdWxhdGVfaHlwZXJjYWxs
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChrdm1fZW11
bGF0ZV9oeXBlcmNhbGwpOwo+ICAKPiArI2RlZmluZSBLVk1fSFlQRVJDQUxMX0lOU05fTEVOIDMK
PiArCj4gIHN0YXRpYyBpbnQgZW11bGF0b3JfZml4X2h5cGVyY2FsbChzdHJ1Y3QgeDg2X2VtdWxh
dGVfY3R4dCAqY3R4dCkKPiAgewo+ICsJaW50IGVycjsKPiAgCXN0cnVjdCBrdm1fdmNwdSAqdmNw
dSA9IGVtdWxfdG9fdmNwdShjdHh0KTsKPiAtCWNoYXIgaW5zdHJ1Y3Rpb25bM107Cj4gKwljaGFy
IGJ1ZltLVk1fSFlQRVJDQUxMX0lOU05fTEVOXTsKPiArCWNoYXIgaW5zdHJ1Y3Rpb25bS1ZNX0hZ
UEVSQ0FMTF9JTlNOX0xFTl07Cj4gIAl1bnNpZ25lZCBsb25nIHJpcCA9IGt2bV9yaXBfcmVhZCh2
Y3B1KTsKPiAgCj4gKwllcnIgPSBlbXVsYXRvcl9yZWFkX2VtdWxhdGVkKGN0eHQsIHJpcCwgYnVm
LCBzaXplb2YoYnVmKSwKPiArCQkJCSAgICAgJmN0eHQtPmV4Y2VwdGlvbik7Cj4gKwlpZiAoZXJy
ICE9IFg4NkVNVUxfQ09OVElOVUUpCj4gKwkJcmV0dXJuIGVycjsKPiArCj4gIAlrdm1feDg2X29w
cy0+cGF0Y2hfaHlwZXJjYWxsKHZjcHUsIGluc3RydWN0aW9uKTsKPiArCWlmICghbWVtY21wKGlu
c3RydWN0aW9uLCBidWYsIHNpemVvZihpbnN0cnVjdGlvbikpKQo+ICsJCS8qCj4gKwkJICogVGhl
IGh5cGVyY2FsbCBpbnN0cnVjdGlvbiBpcyB0aGUgY29ycmVjdCBvbmUuIFJldHJ5Cj4gKwkJICog
aXRzIGV4ZWN1dGlvbiBtYXliZSB3ZSBnb3QgaGVyZSBhcyBhIHJlc3VsdCBvZiBhbgo+ICsJCSAq
IGV2ZW50IG90aGVyIHRoYW4gI1VEIHdoaWNoIGhhcyBiZWVuIHJlc29sdmVkIGluIHRoZQo+ICsJ
CSAqIG1lYW4gdGltZS4KPiArCQkgKi8KPiArCQlyZXR1cm4gWDg2RU1VTF9DT05USU5VRTsKPiAg
Cj4gLQlyZXR1cm4gZW11bGF0b3Jfd3JpdGVfZW11bGF0ZWQoY3R4dCwgcmlwLCBpbnN0cnVjdGlv
biwgMywKPiAtCQkmY3R4dC0+ZXhjZXB0aW9uKTsKPiArCXJldHVybiBlbXVsYXRvcl93cml0ZV9l
bXVsYXRlZChjdHh0LCByaXAsIGluc3RydWN0aW9uLAo+ICsJCQkJICAgICAgIHNpemVvZihpbnN0
cnVjdGlvbiksICZjdHh0LT5leGNlcHRpb24pOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IGRtX3Jl
cXVlc3RfZm9yX2lycV9pbmplY3Rpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
