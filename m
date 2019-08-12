Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62C8A984
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 23:40:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0008BAEF;
	Mon, 12 Aug 2019 21:40:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D3CEEAC8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 21:40:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 563608B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 21:40:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Aug 2019 14:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,379,1559545200"; d="scan'208";a="200279228"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
	([10.54.74.41])
	by fmsmga004.fm.intel.com with ESMTP; 12 Aug 2019 14:40:48 -0700
Date: Mon, 12 Aug 2019 14:40:41 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 00/92] VM introspection
Message-ID: <20190812214041.GA4996@linux.intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Zhang@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDY6NTk6MTVQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINy
IHdyb3RlOgo+ICA1NSBmaWxlcyBjaGFuZ2VkLCAxMzQ4NSBpbnNlcnRpb25zKCspLCAyMjUgZGVs
ZXRpb25zKC0pCgpUaGUgc2l6ZSBvZiB0aGlzIHNlcmllcyBpcyBvdmVyd2hlbG1pbmcsIHRvIHNh
eSB0aGUgbGVhc3QuICBUaGUgcmVtb3RlCnBhZ2VzIGNvbmNlcHQgYW5kIFNQUCBwYXRjaGVzIG9u
IHRoZWlyIG93biB3b3VsZCBiZSBoZWZ0eSBzZXJpZXMgdG8gcmV2aWV3LgoKSXQgd291bGQgYmUg
dmVyeSBoZWxwZnVsIHRvIHJldmlld2VycyB0byByZW9yZGVyIHRoZSBwYXRjaGVzIGFuZCBvbmx5
IHNlbmQKdGhlIGJpdHMgdGhhdCBhcmUgYWJzb2x1dGVseSBtYW5kYXRvcnkgZm9yIGluaXRpYWwg
c3VwcG9ydC4gIEZvciBleGFtcGxlLApBRkFJQ1QgdGhlIFNQUCBzdXBwb3J0IGFuZCByZW1vdGUg
cGFnZXMgY29uY2VwdCBhcmUgbGFyZ2VseSBwZXJmb3JtYW5jZQpyZWxhdGVkIGFuZCBub3QgZnVu
Y3Rpb25hbGx5IHJlcXVpcmVkLgoKTm90ZSwgdGhpcyB3b3VsZG4ndCBwcmV2ZW50IHlvdSBmcm9t
IGNhcnJ5aW5nIHRoZSBzZXJpZXMgaW4gaXRzIGVudGlyZXR5CmluIHlvdXIgb3duIGJyYW5jaGVz
LgoKUG9zc2libGUgcmVvcmRlcmluZzoKCiAgLSBCdWcgZml4ZXMgKGlmIGFueSBwYXRjaGVzIHF1
YWxpZnkgYXMgc3VjaCkKICAtIEVtdWxhdG9yIGNoYW5nZXMKICAtIEtWTSBwcmVwYXJhdG9yeSBw
YXRjaGVzCiAgLSBCYXNpYyBpbnN0cm9zcGVjdGlvbiBmdW5jdGlvbmFsaXR5CgotLS0tLS0+OC0t
LS0tLS0tIGN1dCB0aGUgc2VyaWVzIGhlcmUKCiAgLSBPcHRpb25hbCBpbnRyb3NwZWN0aW9uIGZ1
bmN0aW9uYWxpdHkgKGlmIHRoZXJlIGlzIGFueSkKICAtIFNQUCBhbmQgaW50cm9zcGVjdGlvbiBp
bnRlZ3JhdGlvbgogIC0gUmVtb3RlIHBhZ2VzIGFuZCBpbnRyb3NwZWN0aW9uIGludGVncmF0aW9u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
