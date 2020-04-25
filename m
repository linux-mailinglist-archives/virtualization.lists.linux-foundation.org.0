Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91E1B867C
	for <lists.virtualization@lfdr.de>; Sat, 25 Apr 2020 14:28:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8294E204DF;
	Sat, 25 Apr 2020 12:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8WXOPhI6uWV; Sat, 25 Apr 2020 12:28:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 79A63204CF;
	Sat, 25 Apr 2020 12:28:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 660A7C0175;
	Sat, 25 Apr 2020 12:28:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0BFBC0175
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 893DA87EA2
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvdtuZYcLEM6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:28:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DAA77877E6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:28:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A503AC52;
 Sat, 25 Apr 2020 12:28:39 +0000 (UTC)
Date: Sat, 25 Apr 2020 14:28:35 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Mike Stunes <mstunes@vmware.com>
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
Message-ID: <20200425122835.GM30814@suse.de>
References: <20200319091407.1481-56-joro@8bytes.org>
 <20200424210316.848878-1-mstunes@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424210316.848878-1-mstunes@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jgross@suse.com, thomas.lendacky@amd.com, thellstrom@vmware.com,
 x86@kernel.org, keescook@chromium.org, kvm@vger.kernel.org,
 peterz@infradead.org, joro@8bytes.org, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 luto@kernel.org, hpa@zytor.com, dan.j.williams@intel.com, jslaby@suse.cz
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

Hi Mike,

On Fri, Apr 24, 2020 at 02:03:16PM -0700, Mike Stunes wrote:
> I needed to allow RDTSC(P) from userspace and in early boot in order to
> get userspace started properly. Patch below.

Thanks, but this is not needed anymore. I removed the vc_context_filter
from the code. The emulation code is now capable of safely handling any
exception from user-space.

Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
