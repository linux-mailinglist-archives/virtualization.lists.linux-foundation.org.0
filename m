Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 60346694C9
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 16:53:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BFAE6F16;
	Mon, 15 Jul 2019 14:53:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 55212AD8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 14:53:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
	[216.71.145.142])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B7516876
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 14:53:50 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
	dkim=none (message not signed) header.i=none;
	spf=None smtp.pra=andrew.cooper3@citrix.com;
	spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
	spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	andrew.cooper3@citrix.com) identity=pra;
	client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
	envelope-from="Andrew.Cooper3@citrix.com";
	x-sender="andrew.cooper3@citrix.com";
	x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
	Andrew.Cooper3@citrix.com designates 162.221.158.21 as
	permitted sender) identity=mailfrom;
	client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
	envelope-from="Andrew.Cooper3@citrix.com";
	x-sender="Andrew.Cooper3@citrix.com";
	x-conformance=sidf_compatible; x-record-type="v=spf1";
	x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
	ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
	ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
	ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@mail.citrix.com) identity=helo;
	client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
	envelope-from="Andrew.Cooper3@citrix.com";
	x-sender="postmaster@mail.citrix.com";
	x-conformance=sidf_compatible
IronPort-SDR: CEy5qJZXEW4sSsGrfP3TcRPugWxFwlDxzrJ/wNEHsXxYrPGQlL+gRHd7Cp08EiMiSJRF8cGa03
	f3WKsq3SQ+360IXRgb3t7piFyCRBbLA/9ovMY6F63gcNmS+HF6tIPEwRfOC1lrkxPa80qBz5L6
	JTyDSZjrkuMvqte0Gobjv6IOKD1YWq58YURBrBbePDc7MSfKWOhCg8uXPYlMisYRof2P5xJws6
	OMf7ZnuuiHx2VNF0jpBnkQpREJ8PztN5dVg7rp4B0fzT0geCLfrAXM/JhDiNwReUhMHGW1I2Xj
	XS4=
X-SBRS: 2.7
X-MesageID: 3003839
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3003839"
Subject: Re: [PATCH] x86/paravirt: Drop {read,write}_cr8() hooks
To: Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>
References: <20190715130056.10627-1-andrew.cooper3@citrix.com>
	<a04918d1-975e-5869-1ecd-c9df4ae5b1c1@suse.com>
	<CALCETrX0T=vzyN8gqoBmA72xwzS45d5bDTfcZQJayht9n9ijPA@mail.gmail.com>
	<f51ce980-599b-cae3-e3fa-4a67443ea128@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
	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
	6+ahAA==
Message-ID: <c49f8079-fc3e-8d2e-7e5a-327a7b1bec09@citrix.com>
Date: Mon, 15 Jul 2019 15:53:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f51ce980-599b-cae3-e3fa-4a67443ea128@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
	AMSPEX02CL02.citrite.net (10.69.22.126)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: FengTang <feng.tang@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	X86 ML <x86@kernel.org>, "Rafael J.Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>, Pavel
	Machek <pavel@ucw.cz>, Nadav Amit <namit@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alok Kataria <akataria@vmware.com>
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

T24gMTUvMDcvMjAxOSAxNTo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNS4wNy4xOSAx
NjoyNiwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgo+PiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCA2
OjIzIEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24g
MTUuMDcuMTkgMTU6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gVGhlcmUgaXMgYSBsb3Qg
b2YgaW5mcmFzdHJ1Y3R1cmUgZm9yIGZ1bmN0aW9uYWxpdHkgd2hpY2ggaXMgdXNlZAo+Pj4+IGV4
Y2x1c2l2ZWx5IGluIF9fe3NhdmUscmVzdG9yZX1fcHJvY2Vzc29yX3N0YXRlKCkgb24gdGhlCj4+
Pj4gc3VzcGVuZC9yZXN1bWUKPj4+PiBwYXRoLgo+Pj4+Cj4+Pj4gY3I4IGlzIGFuIGFsaWFzIG9m
IEFQSUNfVEFTS1BSSSwgYW5kIEFQSUNfVEFTS1BSSSBpcyBzYXZlZC9yZXN0b3JlZAo+Pj4+IGlu
ZGVwZW5kZW50bHkgYnkgbGFwaWNfe3N1c3BlbmQscmVzdW1lfSgpLgo+Pj4KPj4+IEFyZW4ndCB0
aG9zZSBjYWxsZWQgb25seSB3aXRoIENPTkZJR19QTSBzZXQ/Cj4+Pgo+Pgo+Pgo+PiBVbmxlc3Mg
SSdtIG1pc3Npbmcgc29tZXRoaW5nLCB3ZSBvbmx5IGJ1aWxkIGFueSBvZiB0aGUgcmVzdG9yZSBj
b2RlCj4+IChpbmNsdWRpbmcgdGhlIHdyaXRlX2NyOCgpIGNhbGwpIGlmIENPTkZJR19QTV9TTEVF
UCBpcyBzZXQsIGFuZCB0aGF0Cj4+IHNlbGVjdHMgQ09ORklHX1BNLCBzbyB3ZSBzaG91bGQgYmUg
ZmluZSwgSSB0aGluay4KPj4KPgo+IE9rYXksIGluIHRoYXQgY2FzZSBJJ2Qgc3VnZ2VzdCB0byBy
ZW1vdmUgImNyOCIgZnJvbSBzdHJ1Y3Qgc2F2ZWRfY29udGV4dAo+IGFzIGl0IHdvbid0IGJlIHVz
ZWQgYW55IGxvbmdlci4KClRvIGJlIGhvbmVzdCwgc2F2aW5nIGFuZCByZXN0b3Jpbmcgb2YgY3I4
IHdpdGhvdXQgdGhlIHJlc3Qgb2YgdGhlIExvY2FsCkFQSUMgc3RhdGUgaXMgY29uY2VwdHVhbGx5
IGJyb2tlbiB0byBiZWdpbiB3aXRoLgoKSWYgdGhlcmUgYXJlIGFueSBidWdzIHJldmVhbGVkIGJ5
IHRoaXMsIHRoZW4gdGhlIGNvcnJlY3QgZml4ZXMgYXJlCmVsc2V3aGVyZS4KCllvdSdyZSByaWdo
dCBhYm91dCB0aGUgc2F2ZWRfY29udGV4dC7CoCBJJ2xsIHN1Ym1pdCBhIHYyIHdpdGggYW4gZXZl
bgpsYXJnZXIgbmVnYXRpdmUgZGlmZnN0YXQuCgp+QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
