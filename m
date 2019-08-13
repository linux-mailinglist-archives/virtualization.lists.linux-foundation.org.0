Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C39A98BB4B
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 16:19:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 06D57CC8;
	Tue, 13 Aug 2019 14:19:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D1379C2A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:19:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 671C38D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:19:26 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	A4E1130644BA; Tue, 13 Aug 2019 17:19:24 +0300 (EEST)
Received: from localhost (unknown [195.210.5.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 8DF49303EF04;
	Tue, 13 Aug 2019 17:19:24 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 13/92] kvm: introspection: make the vCPU wait even
	when its jobs list is empty
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
In-Reply-To: <c82b509a-86a7-6c2c-943e-f78a02e6efb1@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-14-alazar@bitdefender.com>
	<c82b509a-86a7-6c2c-943e-f78a02e6efb1@redhat.com>
Date: Tue, 13 Aug 2019 17:19:51 +0300
Message-ID: <1565705991.C24cA0eF.26375.@15f23d3a749365d981e968181cce585d2dcb3ffa>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00, FROM_EXCESS_BASE64, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C Zhang <yu.c.zhang@intel.com>,
	Radim =?iso-8859-2?b?S3LobeH4?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mihai =?UTF-8?b?RG9uyJt1?= <mdontu@bitdefender.com>
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

T24gVHVlLCAxMyBBdWcgMjAxOSAxMDo0Mzo1MiArMDIwMCwgUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSD
ciB3cm90ZToKPiA+ICt2b2lkIGt2bWlfaGFuZGxlX3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKPiA+ICt7Cj4gPiArCXN0cnVjdCBrdm1pICppa3ZtOwo+ID4gKwo+ID4gKwlpa3ZtID0g
a3ZtaV9nZXQodmNwdS0+a3ZtKTsKPiA+ICsJaWYgKCFpa3ZtKQo+ID4gKwkJcmV0dXJuOwo+ID4g
Kwo+ID4gKwlmb3IgKDs7KSB7Cj4gPiArCQlpbnQgZXJyID0ga3ZtaV9ydW5fam9ic19hbmRfd2Fp
dCh2Y3B1KTsKPiA+ICsKPiA+ICsJCWlmIChlcnIpCj4gPiArCQkJYnJlYWs7Cj4gPiArCX0KPiA+
ICsKPiA+ICsJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKPiA+ICt9Cj4gPiArCj4gCj4gVXNpbmcga3Zt
aV9ydW5fam9ic19hbmRfd2FpdCBmcm9tIHR3byBwbGFjZXMgKGhlcmUgYW5kIGt2bWlfc2VuZF9l
dmVudCkKPiBpcyB2ZXJ5IGNvbmZ1c2luZy4gIERvZXMga3ZtaV9oYW5kbGVfcmVxdWVzdHMgbmVl
ZCB0byBkbyB0aGlzLCBvciBjYW4gaXQKPiBqdXN0IHVzZSBrdm1pX3J1bl9qb2JzPwoKSSB0aGlu
ayBJJ3ZlIGFkZGVkIHRoaXMgd2FpdCB0byBibG9jayB2Q1BVcyBkdXJpbmcgc2luZ2xlLXN0ZXAu
CkEgJ3dhaXRfdW50aWxfc2luZ2xlX3N0ZXBfZmluaXNoZWQnIGpvYiB3aWxsIGRvLCBJIGd1ZXNz
LCBzbyB3ZSBjb3VsZAp1c2Uga3ZtaV9ydW5fam9icygpIGhlcmUuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
