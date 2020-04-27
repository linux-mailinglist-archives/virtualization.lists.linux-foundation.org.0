Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4891BAC60
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 20:22:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A110186812;
	Mon, 27 Apr 2020 18:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0kxqVluYPFX; Mon, 27 Apr 2020 18:22:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 92D33847E6;
	Mon, 27 Apr 2020 18:22:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 648F4C003B;
	Mon, 27 Apr 2020 18:22:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3217C003B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AA7F185F0B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FhdyQpmeKYiK
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:22:20 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.7.6
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DB81F85533
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588011739;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KBBurnKwQk0mJMwfeqD0uyO9fh4p+KVZdnBjFEeHlv4=;
 b=gjh83eutQUs2DzVFTP/AQf7iBlZ48ZGMiCj7O1sWAwBqHrWa2QVNd6Qk
 5sh1jF2wNtza93BggVs4tDCEQF4Z10ZQGox866cAM1OJcP+f2yUf4sBPF
 KbGApLRD6XBbEW30ZdNHhhGUlID3T28pC+B7xDph5lq3JD7dqTaM5yCfU k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ELrzJwrXWLafnbRhhOpo9sUmi2ptJ2dbSjQcB604T4YpDGeUhU1Zj28fONXyGGCdtv0J2MzLme
 XdKmX8FYTey36XrM/OsB2JaDUUC99LUtGFxpHQvrJIgJJR9qtSTItmghnWelKsCmEv4Es0/loA
 7nD6hg1DAWb6O67JNQn9pDkGbYOW6P1mCIEA7IhM8rR37q2YS/ikdhotFDI33VW5CLeFwRmvlX
 VgHNdN4Igthunl6nAHb98NDXTO7YJJbRh5jj5abE4kLhAEiCXMk9j5b/g9dQiXF8CDbK52pYgh
 Kw8=
X-SBRS: 2.7
X-MesageID: 16722682
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,325,1583211600"; d="scan'208";a="16722682"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Andy Lutomirski <luto@kernel.org>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <57aa7412-b9e1-3331-ba30-bb6daaa28ff3@citrix.com>
Date: Mon, 27 Apr 2020 19:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>, Dave
 Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>,
 X86 ML <x86@kernel.org>
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

T24gMjcvMDQvMjAyMCAxODozNywgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgo+IE9uIFNhdCwgQXBy
IDI1LCAyMDIwIGF0IDM6MTAgUE0gQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+IHdy
b3RlOgo+PiBPbiBTYXQsIEFwciAyNSwgMjAyMCBhdCAxOjIzIFBNIEpvZXJnIFJvZWRlbCA8am9y
b0A4Ynl0ZXMub3JnPiB3cm90ZToKPj4+IE9uIFNhdCwgQXByIDI1LCAyMDIwIGF0IDEyOjQ3OjMx
UE0gLTA3MDAsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4+PiBJIGFzc3VtZSB0aGUgcmFjZSB5
b3UgbWVhbiBpczoKPj4+Pgo+Pj4+ICNWQwo+Pj4+IEltbWVkaWF0ZSBOTUkgYmVmb3JlIElTVCBn
ZXRzIHNoaWZ0ZWQKPj4+PiAjVkMKPj4+Pgo+Pj4+IEthYm9vbS4KPj4+Pgo+Pj4+IEhvdyBhcmUg
eW91IGRlYWxpbmcgd2l0aCB0aGlzPyAgVWx0aW1hdGVseSwgSSB0aGluayB0aGF0IE5NSSB3aWxs
IG5lZWQKPj4+PiB0byB0dXJuIG9mZiBJU1QgYmVmb3JlIGVuZ2FnaW5nIGluIGFueSBmdW5ueSBi
dXNpbmVzcy4gTGV0IG1lIHBvbmRlcgo+Pj4+IHRoaXMgYSBiaXQuCj4+PiBSaWdodCwgSSBkZWFs
dCB3aXRoIHRoYXQgYnkgdW5jb25kaXRpb25hbGx5IHNoaWZ0aW5nL3Vuc2hpZnRpbmcgdGhlICNW
QyBJU1QgZW50cnkKPj4+IGluIGRvX25taSgpICh0aGFua3MgdG8gRGF2aW4gS2FwbGFuIGZvciB0
aGUgaWRlYSkuIEl0IG1pZ2h0IGNhdXNlCj4+PiBvbmUgb2YgdGhlIElTVCBzdGFja3MgdG8gYmUg
dW51c2VkIGR1cmluZyBuZXN0aW5nLCBidXQgdGhhdCBpcyBmaW5lLiBUaGUKPj4+IHN0YWNrIG1l
bW9yeSBmb3IgI1ZDIGlzIG9ubHkgYWxsb2NhdGVkIHdoZW4gU0VWLUVTIGlzIGFjdGl2ZSAoaW4g
YW4KPj4+IFNFVi1FUyBWTSkuCj4+IEJsZWNoLiAgSXQgcHJvYmFibHkgd29ya3MsIGJ1dCBzdGls
bCwgeXVjay4gIEl0J3MgYSBiaXQgc2FkIHRoYXQgd2UKPj4gc2VlbSB0byBiZSBncm93aW5nIG1v
cmUgYW5kIG1vcmUgcG9vcmx5IGRlc2lnbmVkIGhhcHBlbnMtYW55d2hlcmUKPj4gZXhjZXB0aW9u
IHR5cGVzIGF0IGFuIGFsYXJtaW5nIHJhdGUuICBXZSBzZWVtIHRvIGhhdmUgI05NLCAjTUMsICNW
QywKPj4gI0hWLCBhbmQgI0RCLiAgVGhpcyBkb2Vzbid0IHJlYWxseSBzY2FsZS4KPiBJIGhhdmUg
YSBzb21ld2hhdCBzZXJpb3VzIHF1ZXN0aW9uOiBzaG91bGQgd2UgdXNlIElTVCBmb3IgI1ZDIGF0
IGFsbD8KPiBBcyBJIHVuZGVyc3RhbmQgaXQsIFJvbWUgYW5kIE5hcGxlcyBtYWtlIGl0IG1hbmRh
dG9yeSBmb3IgaHlwZXJ2aXNvcnMKPiB0byBpbnRlcmNlcHQgI0RCLCB3aGljaCBtZWFucyB0aGF0
LCBkdWUgdG8gdGhlIE1PViBTUyBtZXNzLCBpdCdzIHNvcnQKPiBvZiBtYW5kYXRvcnkgdG8gdXNl
IElTVCBmb3IgI1ZDLiAgQnV0IE1pbGFuIGZpeGVzIHRoZSAjREIgaXNzdWUsIHNvLAo+IGlmIHdl
J3JlIHJ1bm5pbmcgdW5kZXIgYSBzdWZmaWNpZW50bHkgc2Vuc2libGUgaHlwZXJ2aXNvciwgd2Ug
ZG9uJ3QKPiBuZWVkIElTVCBmb3IgI1ZDLgo+Cj4gU28gSSB0aGluayB3ZSBoYXZlIHR3byBjaG9p
Y2VzOgo+Cj4gMS4gVXNlIElTVCBmb3IgI1ZDIGFuZCBkZWFsIHdpdGggYWxsIHRoZSBtZXNzIHRo
YXQgZW50YWlscy4KPgo+IDIuIFNheSB0aGF0IHdlIFNFVi1FUyBjbGllbnQgc3VwcG9ydCBvbiBS
b21lIGFuZCBOYXBsZXMgaXMgZm9yCj4gZGV2ZWxvcG1lbnQgb25seSBhbmQgZG8gYSBxdWljayBi
b290LXRpbWUgY2hlY2sgZm9yIHdoZXRoZXIgI0RCIGlzCj4gaW50ZXJjZXB0ZWQuICAoSnVzdCBz
ZXQgVEYgYW5kIHNlZSB3aGF0IHZlY3RvciB3ZSBnZXQuKSAgSWYgI0RCIGlzCj4gaW50ZXJjZXB0
ZWQsIHByaW50IGEgdmVyeSBsb3VkIHdhcm5pbmcgYW5kIHJlZnVzZSB0byBib290IHVubGVzcyBz
b21lCj4gc3BlY2lhbCBzZXZfZXMuaW5zZWN1cmVfZGV2ZWxvcG1lbnRfbW9kZSBvciBzaW1pbGFy
IG9wdGlvbiBpcyBzZXQuCj4KPiAjMiByZXN1bHRzIGluIHNpbXBsZXIgYW5kIG1vcmUgcm9idXN0
IGVudHJ5IGNvZGUuICAjMSBpcyBtb3JlIHNlY3VyZS4KPgo+IFNvIG15IHF1ZXN0aW9uIGlzOiB3
aWxsIGFueW9uZSBhY3R1YWxseSB1c2UgU0VWLUVTIGluIHByb2R1Y3Rpb24gb24KPiBSb21lIG9y
IE5hcGxlcz8gIEFzIEkgdW5kZXJzdGFuZCBpdCwgaXQncyBub3QgcmVhbGx5IHJlYWR5IGZvciBw
cmltZQo+IHRpbWUgb24gdGhvc2UgY2hpcHMuICBBbmQgZG8gd2UgY2FyZSBpZiB0aGUgY29tYmlu
YXRpb24gb2YgYSBtYWxpY2lvdXMKPiBoeXBlcnZpc29yIGFuZCBtYWxpY2lvdXMgZ3Vlc3QgdXNl
cnNwYWNlIG9uIE1pbGFuIGNhbiBjb21wcm9taXNlIHRoZQo+IGd1ZXN0IGtlcm5lbD8gIEkgZG9u
J3QgdGhpbmsgU0VWLUVTIGlzIHJlYWxseSBtZWFuIHRvIHJlc2lzdCBhCj4gY29uY2VydGVkIGVm
Zm9ydCBieSB0aGUgaHlwZXJ2aXNvciB0byBjb21wcm9taXNlIHRoZSBndWVzdC4KCk1vcmUgc3Bl
Y2lmaWNhbGx5LCBpdCBpcyBtYW5kYXRvcnkgZm9yIGh5cGVydmlzb3JzIHRvIGludGVyY2VwdCAj
REIgdG8KZGVmZW5kIGFnYWluc3QgQ1ZFLTIwMTUtODEwNCwgdW5sZXNzIHRoZXkncmUgd2lsbGlu
ZyB0byB0cnVzdCB0aGUgZ3Vlc3QKbm90IHRvIHRpY2tsZSB0aGF0IGNvcm5lciBjYXNlLgoKVGhp
cyBpcyBiZWxpZXZlZCBmaXhlZCB3aXRoIFNFVi1TTlAgdG8gYWxsb3cgdGhlIGVuY3J5cHRlZCBn
dWVzdCB0byB1c2UKZGVidWdnaW5nIGZ1bmN0aW9uYWxpdHkgd2l0aG91dCBwb3NpbmcgYSBEb1Mg
cmlzayB0byB0aGUgaG9zdC7CoCBJbiB0aGlzCmNhc2UsIHRoZSBoeXBlcnZpc29yIGlzIGV4cGVj
dGVkIG5vdCB0byBpbnRlcmNlcHQgI0RCLgoKSWYgI0RCIGlzIGludGVyY2VwdGVkLCBhbmQgI1ZD
IGRvZXNuJ3QgdXNlIElTVCwgbWFsaWNpb3VzIHVzZXJzcGFjZSBjYW4KY2F1c2UgcHJvYmxlbXMg
d2l0aCBhIG1vdnNzLWRlbGF5ZWQgYnJlYWtwb2ludCBvdmVyIFNZU0NBTEwuCgpUaGUgcXVlc3Rp
b24gYmFzaWNhbGx5IHdoZXRoZXIgaXQgaXMgd29ydGggZ29pbmcgdG8gdGhlIGVmZm9ydCBvZiBt
YWtpbmcKI1ZDIElTVCBhbmQgYWxsIHRoZSBwcm9ibGVtcyB0aGF0IGVudGFpbHMsIHRvIGNvdmVy
IG9uZSBjb3JuZXIgY2FzZSBpbgplYXJsaWVyIGhhcmR3YXJlLgoKVWx0aW1hdGVseSwgdGhpcyBk
ZXBlbmRzIG9uIHdoZXRoZXIgYW55b25lIHBsYW5zIHRvIHB1dCBTRVYtRVMgaW50bwpwcm9kdWN0
aW9uIG9uIHByZSBTRVYtU05QIGhhcmR3YXJlLCBhbmQgaWYgZGV2ZWxvcGVycyB1c2luZyBwcmUt
U0VWLVNOUApoYXJkd2FyZSBhcmUgaGFwcHkgd2l0aCAiZG9uJ3QgcnVuIG1hbGljaW91cyB1c2Vy
c3BhY2UiIG9yICJkb24ndCBydW4KbWFsaWNpb3VzIGtlcm5lbHMgYW5kIHNraXAgdGhlICNEQiBp
bnRlcmNlcHQiIGFzIGEgZmFpciB0cmFkZW9mZiB0bwphdm9pZCB0aGUgI1ZDIElTVCBmdW4uCgp+
QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
