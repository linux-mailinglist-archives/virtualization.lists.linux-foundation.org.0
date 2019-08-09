Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A187FD5
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:24:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84563DD1;
	Fri,  9 Aug 2019 16:24:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E5096D3B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:24:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9EF7D67F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xrswoPf44Z03S3Xl/6YllPqCJtXJb0iLf7341inGhrY=;
	b=L/+gVqcnLKq6HpffUaAVFqOEg/
	w/yz5wAhB2ZX9xaTvGMhg3d/oxasNMn6WEoztRV50n1/KEjpJ/9nDd9FhWMHF4+yBMe6p4P69i0YJ
	pppEFS+j5sas14zZhl8onbamHjBNJAs8PQuUgusm75o4tCRktPw3NQkaAtyIvtnC2RCm1rWjWrhao
	+5SPhkhUQvBoOhYBvhyoozqezG0bD0P7iq+/VCAdq1eq6PHxF+7UHNYbkNFeG5LNBc16apjYo84JG
	CXoNZDvJJeDtCQAJLwU5ZcyJFjSozwDjepJrwhTnhs6AYo6XzJR3ok/b5uFooBeE/plaXChgCdihB
	2w9t3wAQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
	Hat Linux)) id 1hw7h6-0006cM-Uc; Fri, 09 Aug 2019 16:24:44 +0000
Date: Fri, 9 Aug 2019 09:24:44 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>
Subject: DANGER WILL ROBINSON, DANGER
Message-ID: <20190809162444.GP5482@bombadil.infradead.org>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809160047.8319-72-alazar@bitdefender.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	SUBJ_ALL_CAPS autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Zhang@kvack.org,
	Mircea =?iso-8859-1?Q?C=EErjaliu?= <mcirjaliu@bitdefender.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDc6MDA6MjZQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINy
IHdyb3RlOgo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oCj4gQEAgLTQxNyw4ICs0
MTcsMTAgQEAgUEFHRUZMQUcoSWRsZSwgaWRsZSwgUEZfQU5ZKQo+ICAgKi8KPiAgI2RlZmluZSBQ
QUdFX01BUFBJTkdfQU5PTgkweDEKPiAgI2RlZmluZSBQQUdFX01BUFBJTkdfTU9WQUJMRQkweDIK
PiArI2RlZmluZSBQQUdFX01BUFBJTkdfUkVNT1RFCTB4NAoKVWguICBIb3cgZG8geW91IGtub3cg
cGFnZS0+bWFwcGluZyB3b3VsZCBvdGhlcndpc2UgaGF2ZSBiaXQgMiBjbGVhcj8KV2hvJ3MgZ3Vh
cmFudGVlaW5nIHRoYXQ/CgpUaGlzIGlzIGFuIGF3ZnVsbHkgYmlnIHBhdGNoIHRvIHRoZSBtZW1v
cnkgbWFuYWdlbWVudCBjb2RlLCBidXJpZWQgaW4KdGhlIG1pZGRsZSBvZiBhIGdpZ2FudGljIHNl
cmllcyB3aGljaCBhbG1vc3QgZ3VhcmFudGVlcyBub2JvZHkgd291bGQKbG9vayBhdCBpdC4gIEkg
Y2FsbCBzaGVuYW5pZ2Fucy4KCj4gQEAgLTEwMjEsNyArMTAyMiw3IEBAIHZvaWQgcGFnZV9tb3Zl
X2Fub25fcm1hcChzdHJ1Y3QgcGFnZSAqcGFnZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
Cj4gICAqIF9fcGFnZV9zZXRfYW5vbl9ybWFwIC0gc2V0IHVwIG5ldyBhbm9ueW1vdXMgcm1hcAo+
ICAgKiBAcGFnZToJUGFnZSBvciBIdWdlcGFnZSB0byBhZGQgdG8gcm1hcAo+ICAgKiBAdm1hOglW
TSBhcmVhIHRvIGFkZCBwYWdlIHRvLgo+IC0gKiBAYWRkcmVzczoJVXNlciB2aXJ0dWFsIGFkZHJl
c3Mgb2YgdGhlIG1hcHBpbmcJCj4gKyAqIEBhZGRyZXNzOglVc2VyIHZpcnR1YWwgYWRkcmVzcyBv
ZiB0aGUgbWFwcGluZwoKQW5kIG1peGluZyBpbiBmbHVmZiBjaGFuZ2VzIGxpa2UgdGhpcyBpcyBh
IHJlYWwgbm8tbm8uICBUcnkgYWdhaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
