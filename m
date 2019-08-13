Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3E8B218
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:13:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1612AC4E;
	Tue, 13 Aug 2019 08:13:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 028DCBE4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:13:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8172012F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:12:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r1so7799389wrl.7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 01:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=C4MCH+wiKyoHDLRZTqdi1HE4ZG69Yx/Z30XMFS1Md78=;
	b=popkcZldRcpy6MGMxwviQEsZrE3Gpf7rp6w4YflQYjcviLTPGKqfS7HOEUUN4xFqd1
	WCdjGvPQPh3D5w4UYf9lRLGYJpQI1Qmq+5ptMAz2RKAOBdm0byVzSHbaHB3tn0gJ7Up9
	tjMOXD0hqqsB+ZRauQXWfCMwRsPMrPZA5F/ZnW/HS0hfdmzh9XX87mbpI+QEsmCvySbk
	8JrgVhVZTUdABl3WNM61OVvrQy21w5YfvTHNTzUxvBeCgzMADRtuGwVDXV1JwWgJ5d9a
	iUTYJphijY399N4Bp8aUyLvNwXxXZe820gZPEPnnEHl53AXJLDfm8ppRYXijoNrO/iDY
	gR3g==
X-Gm-Message-State: APjAAAVs7NNshzth62xGtjqL0eAtL1Z6oRFTJD9QwqQNE1HIeo/Izqgk
	fMF5L+8t86LQ8MxaAzw1tP0xMQ==
X-Google-Smtp-Source: APXvYqzTGkTsXHr6zZizzD6ULkYclIovnz3N2V8vDYZOluWG0ibcVz+1hwoKcaSTeMWJVha1MYq4yw==
X-Received: by 2002:adf:c613:: with SMTP id n19mr44936601wrg.109.1565683977128;
	Tue, 13 Aug 2019 01:12:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d12:7fa9:fb2d:7edb?
	([2001:b07:6468:f312:5d12:7fa9:fb2d:7edb])
	by smtp.gmail.com with ESMTPSA id a8sm826262wma.31.2019.08.13.01.12.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 01:12:56 -0700 (PDT)
Subject: Re: [RFC PATCH v6 26/92] kvm: x86: add kvm_mmu_nested_pagefault()
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-27-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a35a1d7c-fa36-c4f2-e8e6-7a242789364e@redhat.com>
Date: Tue, 13 Aug 2019 10:12:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-27-alazar@bitdefender.com>
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
	=?UTF-8?B?TmljdciZb3IgQ8OuyJt1?= <ncitu@bitdefender.com>,
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiArc3RhdGljIGJvb2wg
dm14X25lc3RlZF9wYWdlZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKwlpZiAo
dmNwdS0+YXJjaC5leGl0X3F1YWxpZmljYXRpb24gJiBFUFRfVklPTEFUSU9OX0dWQV9UUkFOU0xB
VEVEKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCXJldHVybiB0cnVlOwo+ICt9Cj4gKwoKVGhpcyBo
b29rIGlzIG1pc25hbWVkOyBpdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIG5lc3RlZCB2aXJ0dWFs
aXphdGlvbi4KIFJhdGhlciwgaXQgcmV0dXJucyB0cnVlIGlmIGl0IHRoZSBmYWlsdXJlIGhhcHBl
bmVkIHdoaWxlIHRyYW5zbGF0aW5nCnRoZSBhZGRyZXNzIG9mIGEgZ3Vlc3QgcGFnZSB0YWJsZS4K
ClNWTSBtYWtlcyB0aGUgc2FtZSBpbmZvcm1hdGlvbiBhdmFpbGFibGUgaW4gRVhJVElORk9bMzNd
LgoKUGFvbG8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
