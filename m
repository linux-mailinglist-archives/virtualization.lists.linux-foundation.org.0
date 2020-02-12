Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814115A9F5
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 14:22:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B15FD85BEC;
	Wed, 12 Feb 2020 13:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4N7Lr6DhYJn; Wed, 12 Feb 2020 13:22:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 612CD85BCF;
	Wed, 12 Feb 2020 13:22:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3974DC0177;
	Wed, 12 Feb 2020 13:22:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A870AC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9466983C00
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNo7xi2HpPDF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:22:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 16DE383EEA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:22:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B828620E; Wed, 12 Feb 2020 14:22:29 +0100 (CET)
Date: Wed, 12 Feb 2020 14:22:20 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 50/62] x86/sev-es: Handle VMMCALL Events
Message-ID: <20200212132220.GI20066@8bytes.org>
References: <20200211135256.24617-51-joro@8bytes.org>
 <DC865D59-CAD2-4D1C-919B-1C954B1EFFB1@amacapital.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DC865D59-CAD2-4D1C-919B-1C954B1EFFB1@amacapital.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDQ6MTQ6NTNQTSAtMDgwMCwgQW5keSBMdXRvbWlyc2tp
IHdyb3RlOgo+IAo+IEhvdyBhYm91dCB3ZSBqdXN0IGRvbuKAmXQgZG8gVk1NQ0FMTCBpZiB3ZeKA
mXJlIGEgU0VWLUVTIGd1ZXN0PyAgT3RoZXJ3aXNlCj4gd2UgYWRkIHRob3VzYW5kcyBvZiBjeWNs
ZXMgb2YgZXh0cmEgbGF0ZW5jeSBmb3Igbm8gZ29vZCByZWFzb24uCgpUcnVlLCBidXQgSSBsZWZ0
IHRoYXQgYXMgYSBmdXR1cmUgb3B0aW1pemF0aW9uIGZvciBub3csIGdpdmVuIHRoZSBzaXplCnRo
ZSBwYXRjaC1zZXQgYWxyZWFkeSBoYXMuIFRoZSBpZGVhIGlzIHRvIGFkZCBhbiBhYnN0cmFjdGlv
biBhcm91bmQKVk1NQ0FMTCBmb3IgdGhlIHN1cHBvcnQgY29kZSBvZiB0aGUgdmFyaW91cyBoeXBl
cnZpc29ycyBhbmQganVzdCBkbyBhClZNR0VYSVQgaW4gdGhhdCB3cmFwcGVyIHdoZW4gaW4gYW4g
U0VWLUVTIGd1ZXN0LiBCdXQgYWdhaW4sIHRoYXQgaXMgYQpzZXBhcmF0ZSBwYXRjaC1zZXQuCgpS
ZWdhcmRzLAoKCUpvZXJnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
