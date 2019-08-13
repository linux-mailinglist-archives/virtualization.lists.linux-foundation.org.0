Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD708B265
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:26:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F4BDC6A;
	Tue, 13 Aug 2019 08:26:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 48CDFC3A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:26:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 279E58D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:26:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z1so106923292wru.13
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xxqnQ+CnehHQ/Z2KjoSVBMjf9aqW8bf9s9y55Oqxpus=;
	b=N54nEuwMI81tL/0rJRvC06uUeM8cWDalz5CtfXpodbkfURLIBC0MYntWBoK8Bfrwvd
	RWURYsz3ePBL2EqNb7DDYlkNNGqBfPUYyLKIlJXZ2YfPInlm8WKVgVDO92pQvWhMcmVL
	jD1FHXZnfAGM7jcHMZVCAwp38EfUqotDHlFoYVQDeF/Vc/K3DA89U61DrD2l8N5EWwcQ
	OfQ/K54ywzfx9UVdO4gZ9ikx/LmxY8qEqwDObvNTfE1CyGlJF6z4QlxJ2V1/8flOrtPM
	YR1IamV26/w3WHs3x/v9IVFQJ2zs6CazJBiyv+CREiUvq7JtmuI65mtBNADUIbYR+DmD
	FPWQ==
X-Gm-Message-State: APjAAAVfnO+MlomBTcFGy2OqZvLy8Xc39ma5Z/kiUeQYPnBM4JDIxF0p
	/6FRj1DaFgTVtQCjBLzXBMsH6w==
X-Google-Smtp-Source: APXvYqz4uFItaxiCcQv78nTDKp0pJqOC6D9k/pJKcDrE7Ren7xe2XjGO7pxUM1GtjA16i5a4LjG6iw==
X-Received: by 2002:adf:dec8:: with SMTP id i8mr3468071wrn.217.1565684792723; 
	Tue, 13 Aug 2019 01:26:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d12:7fa9:fb2d:7edb?
	([2001:b07:6468:f312:5d12:7fa9:fb2d:7edb])
	by smtp.gmail.com with ESMTPSA id y7sm595385wmm.19.2019.08.13.01.26.31
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 01:26:32 -0700 (PDT)
Subject: Re: [RFC PATCH v6 14/92] kvm: introspection: handle introspection
	commands before returning to guest
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-15-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <645d86f5-67f6-f5d3-3fbb-5ee9898a7ef8@redhat.com>
Date: Tue, 13 Aug 2019 10:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-15-alazar@bitdefender.com>
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
	=?UTF-8?Q?Mircea_C=c3=aerjaliu?= <mcirjaliu@bitdefender.com>,
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiArCQkJcHJlcGFyZV90
b19zd2FpdF9leGNsdXNpdmUoJnZjcHUtPndxLCAmd2FpdCwKPiArCQkJCQkJICAgVEFTS19JTlRF
UlJVUFRJQkxFKTsKPiArCj4gKwkJCWlmIChrdm1fdmNwdV9jaGVja19ibG9jayh2Y3B1KSA8IDAp
Cj4gKwkJCQlicmVhazsKPiArCj4gKwkJCXdhaXRlZCA9IHRydWU7Cj4gKwkJCXNjaGVkdWxlKCk7
Cj4gKwo+ICsJCQlpZiAoa3ZtX2NoZWNrX3JlcXVlc3QoS1ZNX1JFUV9JTlRST1NQRUNUSU9OLCB2
Y3B1KSkgewo+ICsJCQkJZG9fa3ZtaV93b3JrID0gdHJ1ZTsKPiArCQkJCWJyZWFrOwo+ICsJCQl9
Cj4gKwkJfQo+ICAKPiAtCQl3YWl0ZWQgPSB0cnVlOwo+IC0JCXNjaGVkdWxlKCk7Cj4gKwkJZmlu
aXNoX3N3YWl0KCZ2Y3B1LT53cSwgJndhaXQpOwo+ICsKPiArCQlpZiAoZG9fa3ZtaV93b3JrKQo+
ICsJCQlrdm1pX2hhbmRsZV9yZXF1ZXN0cyh2Y3B1KTsKPiArCQllbHNlCj4gKwkJCWJyZWFrOwo+
ICAJfQoKSXMgdGhpcyBuZWVkZWQ/ICBPciBjYW4gaXQganVzdCBnbyBiYWNrIHRvIEtWTV9SVU4g
YW5kIGhhbmRsZQpLVk1fUkVRX0lOVFJPU1BFQ1RJT04gdGhlcmUgKGluIHdoaWNoIGNhc2UgaXQg
d291bGQgYmUgYmFzaWNhbGx5CnByZW1hdHVyZSBvcHRpbWl6YXRpb24pPwoKUGFvbG8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
