Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A04164267
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 11:42:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3AC6D85A46;
	Wed, 19 Feb 2020 10:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35fzLWTXv1Tu; Wed, 19 Feb 2020 10:42:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB79585B4F;
	Wed, 19 Feb 2020 10:42:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE366C013E;
	Wed, 19 Feb 2020 10:42:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EF2EC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0978C85E43
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tft9VKJ7ojeL
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:42:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9B96685C63
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:42:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id ED39936A; Wed, 19 Feb 2020 11:42:14 +0100 (CET)
Date: Wed, 19 Feb 2020 11:42:13 +0100
From: Joerg Roedel <joro@8bytes.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: [PATCH 23/62] x86/idt: Move IDT to data segment
Message-ID: <20200219104213.GJ22063@8bytes.org>
References: <20200212115516.GE20066@8bytes.org>
 <EEAC8672-C98F-45D0-9F2D-0802516C3908@amacapital.net>
 <879ace44-cee3-98aa-0dff-549b69355096@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <879ace44-cee3-98aa-0dff-549b69355096@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi J=FCrgen,

On Wed, Feb 12, 2020 at 05:28:21PM +0100, J=FCrgen Gro=DF wrote:
> Xen-PV is clearing BSS as the very first action.

In the kernel image? Or in the ELF loader before jumping to the kernel
image?

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
