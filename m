Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D631BC574
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 18:41:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72F8D875E2;
	Tue, 28 Apr 2020 16:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2vNk0uS92vJ; Tue, 28 Apr 2020 16:41:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EAA72875DA;
	Tue, 28 Apr 2020 16:41:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC0F3C0172;
	Tue, 28 Apr 2020 16:41:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3104FC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1F8AE875DA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmxvJrVntu6a
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:41:48 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.7.6
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 68C1E87591
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588092109;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0w6FX0efDJGzaehxYFThqDcH+QYQY0rUFheCeGs7Cu8=;
 b=QDVZsyMUh3NFSIN/R34WoKJDcakBTgFQ+zjfmY3suWZd6EcDY492FDfS
 PIj6/QUq7J+0OHdTwjKl8Ae4J3DESJ3KpXjJFNrPkCgEgLxGcGorDTwDO
 wgKu15uiRbJbkkEzpfLTqOsqoVjUtuIsCB7yuXFfqLp0hd/XSC7t4zr3o g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GfTE0zwlZX/DF1ctKDqrxqeVbE8WVcfOvsjN98osQHnlIj+bOA/2LFcYVb0aH7461lKjAVAfLx
 7j15tUKm7Q9jukDiXGBXe4JArojeffWncpdbJdc8J++Ucn0eFvbBbxBJWeB9VAlVhEsRfeADRX
 IWdKBPAe2bZuNVhHpQqKaPx3D4feKv58+vQM9FlmpNzLI+AL1Z6D6MtcVx42gwF/6YidSiYLvI
 o3l7R+GG2CLL3cZaUut58uQQSlPrgZH5ynhcWk//W7GtWbcIlSDiJOv63nzSwdEOcFOfFhx9DW
 9eM=
X-SBRS: 2.7
X-MesageID: 16638438
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,328,1583211600"; d="scan'208";a="16638438"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b232a8e-af99-4f7b-05c5-584b82853ac5@citrix.com>
Date: Tue, 28 Apr 2020 17:34:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428075512.GP30814@suse.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Cc: Juergen Gross <JGross@suse.com>, Tom
 Lendacky <Thomas.Lendacky@amd.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 X86 ML <x86@kernel.org>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Dan
 Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

T24gMjgvMDQvMjAyMCAwODo1NSwgSm9lcmcgUm9lZGVsIHdyb3RlOgo+IE9uIE1vbiwgQXByIDI3
LCAyMDIwIGF0IDEwOjM3OjQxQU0gLTA3MDAsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4gSSBo
YXZlIGEgc29tZXdoYXQgc2VyaW91cyBxdWVzdGlvbjogc2hvdWxkIHdlIHVzZSBJU1QgZm9yICNW
QyBhdCBhbGw/Cj4+IEFzIEkgdW5kZXJzdGFuZCBpdCwgUm9tZSBhbmQgTmFwbGVzIG1ha2UgaXQg
bWFuZGF0b3J5IGZvciBoeXBlcnZpc29ycwo+PiB0byBpbnRlcmNlcHQgI0RCLCB3aGljaCBtZWFu
cyB0aGF0LCBkdWUgdG8gdGhlIE1PViBTUyBtZXNzLCBpdCdzIHNvcnQKPj4gb2YgbWFuZGF0b3J5
IHRvIHVzZSBJU1QgZm9yICNWQy4gIEJ1dCBNaWxhbiBmaXhlcyB0aGUgI0RCIGlzc3VlLCBzbywK
Pj4gaWYgd2UncmUgcnVubmluZyB1bmRlciBhIHN1ZmZpY2llbnRseSBzZW5zaWJsZSBoeXBlcnZp
c29yLCB3ZSBkb24ndAo+PiBuZWVkIElTVCBmb3IgI1ZDLgo+IFRoZSByZWFzb24gZm9yICNWQyBi
ZWluZyBJU1QgaXMgbm90IG9ubHkgI0RCLCBidXQgYWxzbyBTRVYtU05QLiBTTlAgYWRkcwo+IHBh
Z2Ugb3duZXJzaGlwIHRyYWNraW5nIGJldHdlZW4gZ3Vlc3QgYW5kIGhvc3QsIHNvIHRoYXQgdGhl
IGh5cGVydmlzb3IKPiBjYW4ndCByZW1hcCBndWVzdCBwYWdlcyB3aXRob3V0IHRoZSBndWVzdCBu
b3RpY2luZy4KPgo+IElmIHRoZXJlIGlzIGEgdmlvbGF0aW9uIG9mIG93bmVyc2hpcCwgd2hpY2gg
Y2FuIGhhcHBlbiBhdCBhbnkgbWVtb3J5Cj4gYWNjZXNzLCB0aGVyZSB3aWxsIGJlIGEgI1ZDIGV4
Y2VwdGlvbiB0byBub3RpZnkgdGhlIGd1ZXN0LiBBbmQgYXMgdGhpcwo+IGNhbiBoYXBwZW4gYW55
d2hlcmUsIGZvciBleGFtcGxlIG9uIGEgY2FyZWZ1bGx5IGNyYWZ0ZWQgc3RhY2sgcGFnZSBzZXQK
PiBieSB1c2Vyc3BhY2UgYmVmb3JlIGRvaW5nIFNZU0NBTEwsIHRoZSBvbmx5IHJvYnVzdCBjaG9p
Y2UgZm9yICNWQyBpcyB0bwo+IHVzZSBJU1QuCgpUaGUga2VybmVsIHdvbid0IGV2ZXIgdG91Y2gg
dGhlIGd1ZXN0IHN0YWNrIGJlZm9yZSByZXN0b3JpbmcgJXJzcCBpbiB0aGUKc3lzY2FsbCBwYXRo
LCBidXQgdGhlIChtaW5pbXVtIDIpIG1lbW9yeSBhY2Nlc3NlcyByZXF1aXJlZCB0byBzYXZlIHRo
ZQp1c2VyICVyc3AgYW5kIGxvYWQgdGhlIGtlcm5lbCBzdGFjayBtYXkgYmUgc3ViamVjdCB0byAj
VkMgZXhjZXB0aW9ucywgYXMKYXJlIGluc3RydWN0aW9uIGZldGNoZXMgYXQgdGhlIGhlYWQgb2Yg
dGhlIFNZU0NBTEwgcGF0aC4KClNvIHllcyAtICNWQyBuZWVkcyBJU1QuCgpTb3JyeSBmb3IgdGhl
IG5vaXNlLsKgIChUaGF0IHNhaWQsIGl0IGlzIHVuZm9ydHVuYXRlIHRoYXQgdGhlIGh5cGVydmlz
b3IKbWVzc2luZyB3aXRoIHRoZSBtZW1vcnkgYmFja2luZyB0aGUgZ3Vlc3QgI1ZDIGhhbmRsZXIg
cmVzdWx0cyBpbiBhbgppbmZpbml0ZSBsb29wLCByYXRoZXIgdGhhbiBhbiBhYmlsaXR5IHRvIGNs
ZWFubHkgdGVybWluYXRlLikKCn5BbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
