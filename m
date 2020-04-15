Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A47131AAC5A
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 17:54:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3275784AF9;
	Wed, 15 Apr 2020 15:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOEdbh8v0ATW; Wed, 15 Apr 2020 15:54:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E91D869F2;
	Wed, 15 Apr 2020 15:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54F26C089E;
	Wed, 15 Apr 2020 15:54:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A294AC0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 91A9384E66
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 15:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yD-zrK2+ilYM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 15:54:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3EF3D84AF9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 15:54:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F4A8ACA1;
 Wed, 15 Apr 2020 15:54:29 +0000 (UTC)
Date: Wed, 15 Apr 2020 17:54:28 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 40/70] x86/sev-es: Setup per-cpu GHCBs for the runtime
 handler
Message-ID: <20200415155428.GE21899@suse.de>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-41-joro@8bytes.org>
 <A7DF63B4-6589-4386-9302-6B7F8BE0D9BA@vmware.com>
 <09757a84-1d81-74d5-c425-cff241f02ab9@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09757a84-1d81-74d5-c425-cff241f02ab9@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 "x86@kernel.org" <x86@kernel.org>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Apr 14, 2020 at 03:04:42PM -0500, Tom Lendacky wrote:
> At that point the guest won't be able to communicate with the hypervisor,
> too. Maybe we should BUG() here to terminate further processing?

We could talk to the hypervisor, there is still the boot-GHCB in the
bss-decrypted section. But there is nothing that could be done here
anyway besides terminating the guest.


Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
