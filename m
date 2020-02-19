Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CA164284
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 11:47:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C687F86963;
	Wed, 19 Feb 2020 10:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKs5R+DbWY2R; Wed, 19 Feb 2020 10:47:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 36182864CF;
	Wed, 19 Feb 2020 10:47:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05937C013E;
	Wed, 19 Feb 2020 10:47:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3591AC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2474886759
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWJMYz0d4tun
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:47:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 18FFD8601E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:47:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D5C4ACE8;
 Wed, 19 Feb 2020 10:47:36 +0000 (UTC)
Subject: Re: [PATCH 23/62] x86/idt: Move IDT to data segment
To: Joerg Roedel <joro@8bytes.org>
References: <20200212115516.GE20066@8bytes.org>
 <EEAC8672-C98F-45D0-9F2D-0802516C3908@amacapital.net>
 <879ace44-cee3-98aa-0dff-549b69355096@suse.com>
 <20200219104213.GJ22063@8bytes.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <64f1fa87-17c2-928b-06f5-17b6771fc753@suse.com>
Date: Wed, 19 Feb 2020 11:47:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219104213.GJ22063@8bytes.org>
Content-Language: en-US
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Kees Cook <keescook@chromium.org>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Joerg Roedel <jroedel@suse.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMTkuMDIuMjAgMTE6NDIsIEpvZXJnIFJvZWRlbCB3cm90ZToKPiBIaSBKw7xyZ2VuLAo+IAo+
IE9uIFdlZCwgRmViIDEyLCAyMDIwIGF0IDA1OjI4OjIxUE0gKzAxMDAsIErDvHJnZW4gR3Jvw58g
d3JvdGU6Cj4+IFhlbi1QViBpcyBjbGVhcmluZyBCU1MgYXMgdGhlIHZlcnkgZmlyc3QgYWN0aW9u
Lgo+IAo+IEluIHRoZSBrZXJuZWwgaW1hZ2U/IE9yIGluIHRoZSBFTEYgbG9hZGVyIGJlZm9yZSBq
dW1waW5nIHRvIHRoZSBrZXJuZWwKPiBpbWFnZT8KCkluIHRoZSBrZXJuZWwgaW1hZ2UuCgpTZWUg
YXJjaC94ODYveGVuL3hlbi1oZWFkLlMgLSBzdGFydHVwX3hlbiBpcyB0aGUgZW50cnkgcG9pbnQg
b2YgdGhlCmtlcm5lbC4KCgpKdWVyZ2VuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
