Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DEF24BA80
	for <lists.virtualization@lfdr.de>; Thu, 20 Aug 2020 14:10:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2545A215DF;
	Thu, 20 Aug 2020 12:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Oo8cZKmO-KP; Thu, 20 Aug 2020 12:10:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4819A221D5;
	Thu, 20 Aug 2020 12:10:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 237DCC07FF;
	Thu, 20 Aug 2020 12:10:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02484C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 12:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E340287EB4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 12:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tiv8o1AFflyi
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 12:10:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2291287EAF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 12:10:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDDCEAC23;
 Thu, 20 Aug 2020 12:10:58 +0000 (UTC)
Date: Thu, 20 Aug 2020 14:10:29 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Mike Stunes <mstunes@vmware.com>
Subject: Re: [PATCH v5 00/75] x86: SEV-ES Guest Support
Message-ID: <20200820121029.GD3354@suse.de>
References: <20200724160336.5435-1-joro@8bytes.org>
 <B65392F4-FD42-4AA3-8AA8-6C0C0D1FF007@vmware.com>
 <20200730122645.GA3257@8bytes.org>
 <F5603CBB-31FB-4EE8-B67A-A1F2DBEE28D8@vmware.com>
 <20200818150746.GA3319@8bytes.org>
 <6F9275F4-D5A4-4D30-8729-A57989568CA7@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6F9275F4-D5A4-4D30-8729-A57989568CA7@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

SGkgTWlrZSwKCk9uIFRodSwgQXVnIDIwLCAyMDIwIGF0IDEyOjU4OjEzQU0gKzAwMDAsIE1pa2Ug
U3R1bmVzIHdyb3RlOgo+IFllcywgSSBzdGlsbCBzZWUgdGhlIGlzc3VlIOKAlCBBUHMgYXJlIG9m
ZmxpbmUgYWZ0ZXIgYm9vdC4gSeKAmWxsIHNwZW5kCj4gc29tZSB0aW1lIHNlZWluZyBpZiBJIGNh
biBmaWd1cmUgb3V0IHdoYXQgdGhlIHByb2JsZW0gaXMuIFRoYW5rcyEKClRoYW5rcy4gSSB0aGlu
ayB0aGUgZmlyc3Qgc3RlcCBoZXJlIHdvdWxkIGJlIHRvIGZpbmQgb3V0IHdoZXJlIG9uIHRoZQpB
UHMgKHdoaWNoIFJJUCkgdGhlIGZpcnN0ICNWQyBleGNlcHRpb24gaGFwcGVucy4gSSBndWVzcyBp
biB0aGUgI1ZDCmVudHJ5IGNvZGUgaXQgdHJpZ2dlcnMgdGhlIG5leHQgZXhjZXB0aW9uIHdoZW4g
dHJ5aW5nIHRvIGV4ZWN1dGUgdGhlCmZzZ3NiYXNlIGluc3RydWN0aW9ucy4KClJlZ2FyZHMsCgoJ
Sm9lcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
