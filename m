Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805616403E
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 10:22:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F084A85A46;
	Wed, 19 Feb 2020 09:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlOQDwdNllB4; Wed, 19 Feb 2020 09:22:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E889F85A4B;
	Wed, 19 Feb 2020 09:22:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF02AC1D89;
	Wed, 19 Feb 2020 09:22:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D84BDC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BBA688620F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWf-WUdguboq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:22:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13A1B83C12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:22:52 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1j4LZ7-00015z-GQ; Wed, 19 Feb 2020 10:22:45 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 1EF39103A05; Wed, 19 Feb 2020 10:22:45 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] x86/ioperm: add new paravirt function update_io_bitmap
In-Reply-To: <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
 <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
Date: Wed, 19 Feb 2020 10:22:45 +0100
Message-ID: <8736b7q6ca.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, stable@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6Cj4gT24gMTguMDIuMjAgMjI6
MDMsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gQlRXLCB3aHkgaXNuJ3Qgc3R1ZmYgbGlrZSB0
aGlzIG5vdCBjYXRjaGVkIGR1cmluZyBuZXh0IG9yIGF0IGxlYXN0Cj4+IGJlZm9yZSB0aGUgZmlu
YWwgcmVsZWFzZT8gSXMgbm90aGluZyBydW5uaW5nIENJIG9uIHVwc3RyZWFtIHdpdGggYWxsCj4+
IHRoYXQgWEVOIG11Y2sgYWN0aXZlPwo+Cj4gVGhpcyBwcm9ibGVtIHNob3dlZCB1cCBieSBub3Qg
YmVpbmcgYWJsZSB0byBzdGFydCB0aGUgWCBzZXJ2ZXIgKHByb2JhYmx5Cj4gbm90IHRoZSBmcmVz
aGVzdCBvbmUpIGluIGRvbTAgb24gYSBtb2RlcmF0ZSBhZ2VkIEFNRCBzeXN0ZW0uCj4KPiBPdXIg
Q0kgdGVzdHMgdGVuZCBkbyBiZSBtb3JlIHRleHQgY29uc29sZSBiYXNlZCBmb3IgZG9tMC4KCnRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9pb1twZXJtfHBsXSBzaG91bGQgaGF2ZSBjYXVnaHQg
dGhhdCBhcyB3ZWxsLApyaWdodD8gSWYgbm90LCB3ZSBuZWVkIHRvIGZpeCB0aGUgc2VsZnRlc3Rz
LgoKVGhhbmtzLAoKICAgICAgICB0Z2x4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
