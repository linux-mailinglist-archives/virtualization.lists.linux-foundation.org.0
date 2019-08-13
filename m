Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DF8BB9C
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 16:35:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 618F8BE7;
	Tue, 13 Aug 2019 14:35:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50F2AB7D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:35:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AD5158D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:35:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p74so1743984wme.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 07:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Lqxf8Z0rQTySZp3AWUTugOPDEfv/sn0v4AQtN6QyRsc=;
	b=VoBw1g3X6n9Eq4rtsv53WMofyRAN8L6iwED+CDjNYviGgWo3nvP4vFceEXqUvqtsOY
	fgpI7K1ikZb1czS5MdGG/j/Hyhs7fVBnjm4Hf+5abkPX6cHO7YWcB5rn7BXo3g3YTaPr
	BMTdE9BGrRaeO7D6GOePbC/LaD47lucNCtoxtciQ4MZAahkckN3PM+mDlkFzUNfYOiBB
	GJuvY01hCmb7uMzd8QVgX1jZpudoHPwju9qdBN2bUUYqMCDQQiGzb31iKOtvbZcAe00I
	cTSPnL3H8yQPlZ8U+M2fcxc0Pj5tGUUNNQdc5pEv5X+K5VOqOxt5GCKBoPh9g56/W5X6
	rw7w==
X-Gm-Message-State: APjAAAUyUGICGYFOaZSsXW8zBUhONWAlm8t1YyEIOTqwFkhne1rQV61C
	QYY8DC7pGTswIabmdod6gNQJQA==
X-Google-Smtp-Source: APXvYqyMYCBhf8rY/MB9/wMH1QCr9Vu6nKQhVNm4wEsOIwP/ZmvzsrgT8mr1A8+NWxaviFXBe7iSWQ==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr3674803wmc.112.1565706930235; 
	Tue, 13 Aug 2019 07:35:30 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	r190sm3362812wmf.0.2019.08.13.07.35.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 07:35:29 -0700 (PDT)
Subject: Re: [RFC PATCH v6 75/92] kvm: x86: disable gpa_available optimization
	in emulator_read_write_onepage()
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-76-alazar@bitdefender.com>
	<eb748e05-8289-0c05-6907-b6c898f6080b@redhat.com>
	<5d52ca22.1c69fb81.4ceb8.e90bSMTPIN_ADDED_BROKEN@mx.google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5b6f78ca-a5c5-80c4-05af-cbf7fabb96b3@redhat.com>
Date: Tue, 13 Aug 2019 16:35:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d52ca22.1c69fb81.4ceb8.e90bSMTPIN_ADDED_BROKEN@mx.google.com>
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
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>
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

T24gMTMvMDgvMTkgMTY6MzMsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBPbiBUdWUsIDEzIEF1
ZyAyMDE5IDEwOjQ3OjM0ICswMjAwLCBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29t
PiB3cm90ZToKPj4gT24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPj4+
IElmIHRoZSBFUFQgdmlvbGF0aW9uIHdhcyBjYXVzZWQgYnkgYW4gZXhlY3V0ZSByZXN0cmljdGlv
biBpbXBvc2VkIGJ5IHRoZQo+Pj4gaW50cm9zcGVjdGlvbiB0b29sLCBncGFfYXZhaWxhYmxlIHdp
bGwgcG9pbnQgdG8gdGhlIGluc3RydWN0aW9uIHBvaW50ZXIsCj4+PiBub3QgdGhlIHRvIHRoZSBy
ZWFkL3dyaXRlIGxvY2F0aW9uIHRoYXQgaGFzIHRvIGJlIHVzZWQgdG8gZW11bGF0ZSB0aGUKPj4+
IGN1cnJlbnQgaW5zdHJ1Y3Rpb24uCj4+Pgo+Pj4gVGhpcyBvcHRpbWl6YXRpb24gc2hvdWxkIGJl
IGRpc2FibGVkIG9ubHkgd2hlbiB0aGUgVk0gaXMgaW50cm9zcGVjdGVkLAo+Pj4gbm90IGp1c3Qg
YmVjYXVzZSB0aGUgaW50cm9zcGVjdGlvbiBzdWJzeXN0ZW0gaXMgcHJlc2VudC4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Cj4+
Cj4+IFRoZSByaWdodCB0aGluZyB0byBkbyBpcyB0byBub3Qgc2V0IGdwYV9hdmFpbGFibGUgZm9y
IGZldGNoIGZhaWx1cmVzIGluIAo+PiBrdm1fbW11X3BhZ2VfZmF1bHQgaW5zdGVhZDoKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUuYwo+PiBp
bmRleCAyNDg0M2NmNDk1NzkuLjFiZGNhNDBmYTgzMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYv
a3ZtL21tdS5jCj4+ICsrKyBiL2FyY2gveDg2L2t2bS9tbXUuYwo+PiBAQCAtNTM2NCw4ICs1MzY0
LDEyIEBAIGludCBrdm1fbW11X3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBndmFf
dCBjcjIsIHU2NCBlcnJvcl9jb2RlLAo+PiAgCWVudW0gZW11bGF0aW9uX3Jlc3VsdCBlcjsKPj4g
IAlib29sIGRpcmVjdCA9IHZjcHUtPmFyY2gubW11LT5kaXJlY3RfbWFwOwo+PiAgCj4+IC0JLyog
V2l0aCBzaGFkb3cgcGFnZSB0YWJsZXMsIGZhdWx0X2FkZHJlc3MgY29udGFpbnMgYSBHVkEgb3Ig
bkdQQS4gICovCj4+IC0JaWYgKHZjcHUtPmFyY2gubW11LT5kaXJlY3RfbWFwKSB7Cj4+ICsJLyoK
Pj4gKwkgKiBXaXRoIHNoYWRvdyBwYWdlIHRhYmxlcywgZmF1bHRfYWRkcmVzcyBjb250YWlucyBh
IEdWQSBvciBuR1BBLgo+PiArCSAqIE9uIGEgZmV0Y2ggZmF1bHQsIGZhdWx0X2FkZHJlc3MgY29u
dGFpbnMgdGhlIGluc3RydWN0aW9uIHBvaW50ZXIuCj4+ICsJICovCj4+ICsJaWYgKHZjcHUtPmFy
Y2gubW11LT5kaXJlY3RfbWFwICYmCj4+ICsJICAgIGxpa2VseSghKGVycm9yX2NvZGUgJiBQRkVS
Ul9GRVRDSF9NQVNLKSkgewo+PiAgCQl2Y3B1LT5hcmNoLmdwYV9hdmFpbGFibGUgPSB0cnVlOwo+
PiAgCQl2Y3B1LT5hcmNoLmdwYV92YWwgPSBjcjI7Cj4+ICAJfQo+Cj4gU3VyZSwgYnV0IEkgdGhp
bmsgd2UnbGwgaGF2ZSB0byBleHRlbmQgdGhlIGNoZWNrLgo+IAo+IFNlYXJjaGluZyB0aGUgbG9n
cyBJJ3ZlIGZvdW5kOgo+IAo+ICAgICBrdm0veDg2OiByZS10cmFuc2xhdGUgYnJva2VuIHRyYW5z
bGF0aW9uIHRoYXQgY2F1c2VkIEVQVCB2aW9sYXRpb24KPiAgICAgCj4gICAgIFNpZ25lZC1vZmYt
Ynk6IE1pcmNlYSBDaXJqYWxpdSA8bWNpcmphbGl1QGJpdGRlZmVuZGVyLmNvbT4KPiAKPiAgYXJj
aC94ODYva3ZtL3g4Ni5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
IAo+IC9ob21lL2Iva3ZtaUA5Y2FkODQ0fjEvYXJjaC94ODYva3ZtL3g4Ni5jOjQ3NTcsNDc2MiAt
IC9ob21lL2Iva3ZtaUA5Y2FkODQ0L2FyY2gveDg2L2t2bS94ODYuYzo0NzU3LDQ3NjMKPiAgIAkg
Ki8KPiAgIAlpZiAodmNwdS0+YXJjaC5ncGFfYXZhaWxhYmxlICYmCj4gICAJICAgIGVtdWxhdG9y
X2Nhbl91c2VfZ3BhKGN0eHQpICYmCj4gKyAJICAgICh2Y3B1LT5hcmNoLmVycm9yX2NvZGUgJiBQ
RkVSUl9HVUVTVF9GSU5BTF9NQVNLKSAmJgo+ICAgCSAgICAoYWRkciAmIH5QQUdFX01BU0spID09
ICh2Y3B1LT5hcmNoLmdwYV92YWwgJiB+UEFHRV9NQVNLKSkgewo+ICAgCQlncGEgPSB2Y3B1LT5h
cmNoLmdwYV92YWw7Cj4gICAJCXJldCA9IHZjcHVfaXNfbW1pb19ncGEodmNwdSwgYWRkciwgZ3Bh
LCB3cml0ZSk7Cj4gCgpZZXMsIGFkZGluZyB0aGF0IGNoZWNrIG1ha2VzIHNlbnNlIGFzIHdlbGwg
KHN0aWxsIGluIGt2bV9tbXVfcGFnZV9mYXVsdCkuCgpQYW9sbwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
