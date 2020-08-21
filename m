Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3FF24D047
	for <lists.virtualization@lfdr.de>; Fri, 21 Aug 2020 10:05:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2793D203FB;
	Fri, 21 Aug 2020 08:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgO73mnyVrZ9; Fri, 21 Aug 2020 08:05:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5D1952038A;
	Fri, 21 Aug 2020 08:05:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 274F1C0051;
	Fri, 21 Aug 2020 08:05:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE477C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B9C468864B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWuJsdfLRP+p
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:05:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D7A158863E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:05:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 744CF2AC; Fri, 21 Aug 2020 10:05:34 +0200 (CEST)
Date: Fri, 21 Aug 2020 10:05:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Mike Stunes <mstunes@vmware.com>
Subject: Re: [PATCH v5 00/75] x86: SEV-ES Guest Support
Message-ID: <20200821080531.GC3319@8bytes.org>
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
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
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
biBmaWd1cmUgb3V0IHdoYXQgdGhlIHByb2JsZW0gaXMuIFRoYW5rcyEKClRvbSBhbmQgYSBmZXcg
b3RoZXJzIGRlYnVnZ2VkIGFub3RoZXIgRlNHU0JBU0UgaXNzdWUgeWVzdGVyZGF5LCB3aGljaCBJ
CnRoaW5rIG1pZ2h0IGFsc28gYmUgdGhlIGNhdXNlIGZvciB0aGUgQVAgc3RhcnR1cCBwcm9ibGVt
cyB5b3UgYXJlCnNlZWluZyAoaWYgeW91IHRlc3Qgb24gUm9tZSkuCgpDYW4geW91IHRyeSB0byBk
aXNhYmxlIHN1cHBvcnQgZm9yIFJEUElEIGluIHRoZSBndWVzdCwgYnV0IGtlZXAgZnNnc2Jhc2UK
ZW5hYmxlZD8KClRoYW5rcywKCglKb2VyZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
