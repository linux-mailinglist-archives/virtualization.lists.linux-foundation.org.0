Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F498B820
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 14:10:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7A96CCC3;
	Tue, 13 Aug 2019 12:09:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50F1ECAC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:09:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF7B787E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:09:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so1281480wma.1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 05:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gDECUkDx4MmZTU2TRfkEx9c0GNMHS7ThvPK76SizlZs=;
	b=r4FhS836Jt/yrkWx/M/Mdj1kAUtvQYzXbaB5QRJsBgTfbHEPCdCQuLVgj8FLyMnhJ7
	HAVtnv3YGGggI76K7iwMypti84BhphzFDCUdH7GHTuXmWfshNfZy6nqkYUuK57riamVF
	UdqKxbdcAxOawa/MvKOgKLL7rlim1GgIlQEmwK4UL9eu8bPdhERtXqDNbmm9VngUK7g7
	dMbrQn5ELYqtbb7j+qo05e7TqP/ZQHHAd3O8WEiZZRT6wBZtnJe59M7VTtLbOrdyOBDj
	ti84OvaEXcckeavJ1fFFnzTzp4m6IEqTeKA74GGuEuLVJ4KLnfp1dNC8tWbw+OD9Dq7W
	GAIQ==
X-Gm-Message-State: APjAAAU1BHkQ3KHlAj9+prU++2TlRHssu9bH0lq6T8KRFTvdoVE0lR13
	djJgMyQ7gRDZh69OJJwkhNs2vA==
X-Google-Smtp-Source: APXvYqzB612TQbc7of6OKwGZTQDBF2YBSrRWlPNUTz0Jo1N+YWu/anTDovRV4uYtYUMMFIBRr0LWzQ==
X-Received: by 2002:a1c:c00e:: with SMTP id q14mr2852175wmf.142.1565698193218; 
	Tue, 13 Aug 2019 05:09:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5193:b12b:f4df:deb6?
	([2001:b07:6468:f312:5193:b12b:f4df:deb6])
	by smtp.gmail.com with ESMTPSA id
	g26sm1123736wmh.32.2019.08.13.05.09.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 05:09:52 -0700 (PDT)
Subject: Re: [RFC PATCH v6 01/92] kvm: introduce KVMI (VM introspection
	subsystem)
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-2-alazar@bitdefender.com>
	<20190812202030.GB1437@linux.intel.com>
	<5d52a5ae.1c69fb81.5c260.1573SMTPIN_ADDED_BROKEN@mx.google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5fa6bd89-9d02-22cd-24a8-479abaa4f788@redhat.com>
Date: Tue, 13 Aug 2019 14:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d52a5ae.1c69fb81.5c260.1573SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Zhang@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
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

T24gMTMvMDgvMTkgMTM6NTcsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPj4gVGhlIHJlZmNvdW50
aW5nIGFwcHJvYWNoIHNlZW1zIGEgYml0IGJhY2t3YXJkcywgYW5kIEFGQUlDVCBpcyBkcml2ZW4g
YnkKPj4gaW1wbGVtZW50aW5nIHVuaG9vayB2aWEgYSBtZXNzYWdlLCB3aGljaCBhbHNvIHNlZW1z
IGJhY2t3YXJkcy4gIEkgYXNzdW1lCj4+IGhvb2sgYW5kIHVuaG9vayBhcmUgcmVsYXRpdmVseSBy
YXJlIGV2ZW50cyBhbmQgbm90IHBlcmZvcm1hbmNlIGNyaXRpY2FsLAo+PiBzbyBtYWtlIHRob3Nl
IHRoZSByZXN0cmljdGVkL3Nsb3cgZmxvd3MsIGUuZy4gZm9yY2UgdXNlcnNwYWNlIHRvIHF1aWVz
Y2UKPj4gdGhlIFZNIGJ5IG1ha2luZyB1bmhvb2soKSBtdXR1YWxseSBleGNsdXNpdmUgd2l0aCBl
dmVyeSB2Y3B1IGlvY3RsKCkgYW5kCj4+IG1heWJlIGFueXRoaW5nIHRoYXQgdGFrZXMga3ZtLT5s
b2NrLiAKPj4KPj4gVGhlbiBrdm1pX2lvY3RsX3VuaG9vaygpIGNhbiB1c2UgdGhyZWFkX3N0b3Ao
KSBhbmQga3ZtaV9yZWN2KCkganVzdCBuZWVkcwo+PiB0byBjaGVjayBrdGhyZWFkX3Nob3VsZF9z
dG9wKCkuCj4+Cj4+IFRoYXQgd2F5IGt2bWkgZG9lc24ndCBuZWVkIHRvIGJlIHJlZmNvdW50ZWQg
c2luY2UgaXQncyBndWFyYW50ZWVkIHRvIGJlCj4+IGFsaXZlIGlmIHRoZSBwb2ludGVyIGlzIG5v
bi1udWxsLiAgRWxpbWluYXRpbmcgdGhlIHJlZmNvdW50aW5nIHdpbGwgY2xlYW4KPj4gdXAgYSBs
b3Qgb2YgdGhlIGNvZGUgYnkgZWxpbWluYXRpbmcgY2FsbHMgdG8ga3ZtaV97Z2V0LHB1dH0oKSwg
ZS5nLgo+PiB3cmFwcGVycyBsaWtlIGt2bWlfYnJlYWtwb2ludF9ldmVudCgpIGp1c3QgY2hlY2sg
dmNwdS0+a3ZtaSwgb3IgbWF5YmUKPj4gZXZlbiBnZXQgZHJvcHBlZCBhbHRvZ2V0aGVyLgo+IAo+
IFRoZSB1bmhvb2sgZXZlbnQgaGFzIGJlZW4gYWRkZWQgdG8gY292ZXIgdGhlIGZvbGxvd2luZyBj
YXNlOiB3aGlsZSB0aGUKPiBpbnRyb3NwZWN0aW9uIHRvb2wgcnVucyBpbiBhbm90aGVyIFZNLCBi
b3RoIFZNcywgdGhlIHZpcnR1YWwgYXBwbGlhbmNlCj4gYW5kIHRoZSBpbnRyb3NwZWN0ZWQgVk0s
IGNvdWxkIGJlIHBhdXNlZCBieSB0aGUgdXNlci4gV2UgbmVlZGVkIGEgd2F5Cj4gdG8gc2lnbmFs
IHRoaXMgdG8gdGhlIGludHJvc3BlY3Rpb24gdG9vbCBhbmQgZ2l2ZSBpdCB0aW1lIHRvIHVuaG9v
awo+ICh0aGUgaW50cm9zcGVjdGVkIFZNIGhhcyB0byBydW4gYW5kIGV4ZWN1dGUgdGhlIGludHJv
c3BlY3Rpb24gY29tbWFuZHMKPiBkdXJpbmcgdGhpcyBwaGFzZSkuIFRoZSByZWNlaXZpbmcgdGhy
ZWFkcyBxdWl0cyB3aGVuIHRoZSBzb2NrZXQgaXMgY2xvc2VkCj4gKGJ5IFFFTVUgb3IgYnkgdGhl
IGludHJvc3BlY3Rpb24gdG9vbCkuCj4gCj4gSXQncyBhIGJpdCB1bmNsZWFyIGhvdywgYnV0IHdl
J2xsIHRyeSB0byBnZXQgcmlkZSBvZiB0aGUgcmVmY291bnQgb2JqZWN0LAo+IHdoaWNoIHdpbGwg
cmVtb3ZlIGEgbG90IG9mIGNvZGUsIGluZGVlZC4KCllvdSBjYW4ga2VlcCBpdCBmb3Igbm93LiAg
SXQgbWF5IGJlY29tZSBjbGVhcmVyIGhvdyB0byBmaXggaXQgYWZ0ZXIgdGhlCmV2ZW50IGxvb3Ag
aXMgY2xlYW5lZCB1cC4KCj4+Cj4+PiArdm9pZCBrdm1pX2NyZWF0ZV92bShzdHJ1Y3Qga3ZtICpr
dm0pCj4+PiArewo+Pj4gKwlpbml0X2NvbXBsZXRpb24oJmt2bS0+a3ZtaV9jb21wbGV0ZWQpOwo+
Pj4gKwljb21wbGV0ZSgma3ZtLT5rdm1pX2NvbXBsZXRlZCk7Cj4+IFByZXR0eSBzdXJlIHlvdSBk
b24ndCB3YW50IHRvIGJlIGNhbGxpbmcgY29tcGxldGUoKSBoZXJlLgo+IFRoZSBpbnRlbnRpb24g
d2FzIHRvIHN0b3AgdGhlIGhvb2tpbmcgaW9jdGwgdW50aWwgdGhlIFZNIGlzCj4gY3JlYXRlZC4g
QSBiZXR0ZXIgbmFtZSBmb3IgJ2t2bWlfY29tcGxldGVkJyB3b3VsZCBoYXZlIGJlZW4KPiAncmVh
ZHlfdG9fYmVfaW50cm9zcGVjdGVkJywgYXMga3ZtaV9ob29rKCkgd2lsbCB3YWl0IGZvciBpdC4K
PiAKPiBXZSdsbCBzZWUgaG93IHdlIGNhbiBnZXQgcmlkZSBvZiB0aGUgY29tcGxldGlvbiBvYmpl
Y3QuCgpUaGUgaW9jdGxzIGFyZSBub3QgYWNjZXNzaWJsZSB3aGlsZSBrdm1fY3JlYXRlX3ZtIHJ1
bnMgKG9ubHkgYWZ0ZXIKa3ZtX2Rldl9pb2N0bF9jcmVhdGVfdm0gY2FsbHMgZmRfaW5zdGFsbCku
ICBFdmVuIGlmIGl0IHdlcmUsIGhvd2V2ZXIsCnlvdSBzaG91bGQgaGF2ZSBwbGFjZWQgaW5pdF9j
b21wbGV0aW9uIG11Y2ggZWFybGllciwgb3RoZXJ3aXNlCndhaXRfZm9yX2NvbXBsZXRpb24gd291
bGQgYWNjZXNzIHVuaW5pdGlhbGl6ZWQgbWVtb3J5LgoKUGFvbG8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
