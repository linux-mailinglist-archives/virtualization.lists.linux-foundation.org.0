Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6613D8B366
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:08:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6D1F4CBC;
	Tue, 13 Aug 2019 09:08:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4ABA3CA5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:08:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 971DB8D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:08:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so107026606wrr.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vSEPUTqGTvTIlPA47HMgabptB4wTrjlnzVdVCCfiQHw=;
	b=eS6Liyg0EiirmyXOuqquRzxr7safK9rRlvo5qiFUJY81fEJHElfaVMORBqWFmdjA1m
	zW3cf3rwFx2d8IZUBlxxWHWLX1grOHtqW7qHxA2yK0pyKqP00Vi1FpHVYYCLDVgduy5f
	53dJehDPMm4rs6qNAKpa2GhUoqM1xfluI0usNNyPEZZ7iJpH+Z/AysYfiI0ebmRO83BO
	iSGwPj9EYQ6M1E/e4wn1KBgn95ThiaHLedyabK3eLt/3cu2/3wMT84zseuvYVUvogBCn
	lmSQ4cX03dp4H5WrRQ/LVuNnQymGejnL6ovWKdoGb4DGmyeQCef3qsEBBHldZL/VnxfM
	heRw==
X-Gm-Message-State: APjAAAXvtBBIZvoEq8lBBfuddc4TgS0EAviYisW2a5Z8XU+lZxpmSXzI
	PalbJBuV+J3LVdMwy/xho4I3Kw==
X-Google-Smtp-Source: APXvYqxphI9IUoLpUIef25ST16HnKb9bpvR5V1zmLOhTuusS26HOW6o20LLiYcUp6Q4TqPyLCN+ZUA==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr29345197wre.114.1565687322206;
	Tue, 13 Aug 2019 02:08:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d12:7fa9:fb2d:7edb?
	([2001:b07:6468:f312:5d12:7fa9:fb2d:7edb])
	by smtp.gmail.com with ESMTPSA id
	q18sm134649129wrw.36.2019.08.13.02.08.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:08:41 -0700 (PDT)
Subject: Re: [RFC PATCH v6 70/92] kvm: x86: filter out access rights only when
	tracked by the introspection tool
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-71-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8cba6816-8d3a-2498-b3b0-2ce76a98ce12@redhat.com>
Date: Tue, 13 Aug 2019 11:08:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-71-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBJdCBzaG91bGQgY29t
cGxldGUgdGhlIGNvbW1pdCBmZDM0YTk1MTgxNzMgKCJrdm06IHg4NjogY29uc3VsdCB0aGUgcGFn
ZSB0cmFja2luZyBmcm9tIGt2bV9tbXVfZ2V0X3BhZ2UoKSBhbmQgX19kaXJlY3RfbWFwKCkiKQo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNv
bT4KPiAtLS0KPiAgYXJjaC94ODYva3ZtL21tdS5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11LmMgYi9h
cmNoL3g4Ni9rdm0vbW11LmMKPiBpbmRleCA2NWI2YWNiYTgyZGEuLmZkNjRjZjExMTVkYSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3g4Ni9rdm0vbW11LmMKPiArKysgYi9hcmNoL3g4Ni9rdm0vbW11LmMK
PiBAQCAtMjY2MCw2ICsyNjYwLDkgQEAgc3RhdGljIHZvaWQgY2xlYXJfc3Bfd3JpdGVfZmxvb2Rp
bmdfY291bnQodTY0ICpzcHRlKQo+ICBzdGF0aWMgdW5zaWduZWQgaW50IGt2bV9tbXVfcGFnZV90
cmFja19hY2Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sCj4gIAkJCQkJICAgdW5z
aWduZWQgaW50IGFjYykKPiAgewo+ICsJaWYgKCFrdm1pX3RyYWNrZWRfZ2ZuKHZjcHUsIGdmbikp
Cj4gKwkJcmV0dXJuIGFjYzsKPiArCj4gIAlpZiAoa3ZtX3BhZ2VfdHJhY2tfaXNfYWN0aXZlKHZj
cHUsIGdmbiwgS1ZNX1BBR0VfVFJBQ0tfUFJFUkVBRCkpCj4gIAkJYWNjICY9IH5BQ0NfVVNFUl9N
QVNLOwo+ICAJaWYgKGt2bV9wYWdlX3RyYWNrX2lzX2FjdGl2ZSh2Y3B1LCBnZm4sIEtWTV9QQUdF
X1RSQUNLX1BSRVdSSVRFKSB8fAo+IAoKSWYgdGhpcyBwYXRjaCBpcyBhbHdheXMgbmVlZGVkLCB0
aGVuIHRoZSBmdW5jdGlvbiBzaG91bGQgYmUgbmFtZWQKc29tZXRoaW5nIGxpa2Uga3ZtX21tdV9h
cHBseV9pbnRyb3NwZWN0aW9uX2FjY2VzcyBhbmQga3ZtaV90cmFja2VkX2dmbgpzaG91bGQgYmUg
dGVzdGVkIGZyb20gdGhlIG1vbWVudCBpdCBpcyBpbnRyb2R1Y2VkLgoKQnV0IHRoZSBjb21taXQg
bWVzc2FnZSBzYXlzIG5vdGhpbmcgYWJvdXQgX3doeV8gaXQgaXMgbmVlZGVkLCBzbyBJCmNhbm5v
dCBndWVzcy4gIEkgd291bGQgdmVyeSBtdWNoIGF2b2lkIGl0IGhvd2V2ZXIuICBJcyBpdCBqdXN0
IGFuCm9wdGltaXphdGlvbj8KClBhb2xvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
