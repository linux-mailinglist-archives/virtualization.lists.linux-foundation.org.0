Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 325048B35B
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:07:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 278CDCA8;
	Tue, 13 Aug 2019 09:06:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5FF27AF0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C41FACF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:06:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z11so5092430wrt.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MRboZnkOwIqMqx46t0ZQ9zepiSGdc691QK9w7wR1ygw=;
	b=Dxz3EZZqTDnROro+2Y5hjO2NzJtIawmg6sB41O3YiZOixh5icMwDrVSAMBZLei5ZJE
	wdezyhnS5Zbf9hmDi/EAQk3xoPniS3MbEBDnsXZyaXXNbyuvZFyORBI/DkDD4p0E1z+Y
	luiP1OcI5PR3zg+FKRSNnM13KX4B4aHDTIXmmuF0XW+MOjxmXlUqu5276Wf5Snwmd/jh
	At0CflFBexajmfKZdfXsmerzukGKcX7U12pvWt6Yo6XPU3iIQg8mx7ZMAw37FjVN7Its
	1DEh6rAASLosgy7ZjhoedV1+kIhNpK79W6B6QLY9ZzqSoRLv3aTvEgE9gQ2FtZNlZWBe
	4ssw==
X-Gm-Message-State: APjAAAUptaLrQ41mOE+n6RDeuL1tVO2a5Z8Kox89s6F13Hgdqu42ycnA
	dfsFAciFXgwnKjL/fbYdEoAUvA==
X-Google-Smtp-Source: APXvYqweK6uM1R3qYisV+zwsl38ikaVzEXE80NEPe0UggCtqMVhBk6tbs9HWluPuTVYiwrckbrYbsA==
X-Received: by 2002:adf:aa8d:: with SMTP id h13mr39037899wrc.307.1565687213313;
	Tue, 13 Aug 2019 02:06:53 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id a17sm677722wmm.47.2019.08.13.02.06.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:06:52 -0700 (PDT)
Subject: Re: [RFC PATCH v6 27/92] kvm: introspection: use page track
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-28-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0e6703cd-2d0b-ccd2-c353-c5f5de659837@redhat.com>
Date: Tue, 13 Aug 2019 11:06:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-28-alazar@bitdefender.com>
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
	Marian Rotariu <marian.c.rotariu@gmail.com>,
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiArCj4gKwkvKgo+ICsJ
ICogVGhpcyBmdW5jdGlvbiB1c2VzIGt2bS0+bW11X2xvY2sgc28gaXQncyBub3QgYWxsb3dlZCB0
byBiZQo+ICsJICogY2FsbGVkIHVuZGVyIGt2bWlfcHV0KCkuIEl0IGNhbiByZWFjaCBhIGRlYWRs
b2NrIGlmIGNhbGxlZAo+ICsJICogZnJvbSBrdm1fbW11X2xvYWQgLT4ga3ZtaV90cmFja2VkX2dm
biAtPiBrdm1pX3B1dC4KPiArCSAqLwo+ICsJa3ZtaV9jbGVhcl9tZW1fYWNjZXNzKGt2bSk7Cgpr
dm1pX3RyYWNrZWRfZ2ZuIGRvZXMgbm90IGV4aXN0IHlldC4KCk1vcmUgaW4gZ2VuZXJhbCwgdGhp
cyBjb21tZW50IHNheXMgd2h5IHlvdSBhcmUgY2FsbGluZyB0aGlzIGhlcmUsIGJ1dCBpdApzYXlz
IG5vdGhpbmcgYWJvdXQgdGhlIHNwbGl0IG9mIHJlc3BvbnNpYmlsaXR5IGJldHdlZW4Ka3ZtaV9l
bmRfaW50cm9zcGVjdGlvbiBhbmQga3ZtaV9yZWxlYXNlLiAgUGxlYXNlIGFkZCBhIGNvbW1lbnQg
Zm9yIHRoaXMKYXMgc29vbiBhcyB5b3UgYWRkIGt2bWlfZW5kX2ludHJvc3BlY3Rpb24gKHdoaWNo
IGFjY29yZGluZyB0byBteSBlYXJsaWVyCnJldmlldyBzaG91bGQgYmUgcGF0Y2ggMSkuCgpQYW9s
bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
