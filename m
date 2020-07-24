Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A988922D04F
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 23:10:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 59B8C894D3;
	Fri, 24 Jul 2020 21:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhQLGuKHcckX; Fri, 24 Jul 2020 21:10:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CCF3E894CF;
	Fri, 24 Jul 2020 21:10:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B215DC004C;
	Fri, 24 Jul 2020 21:10:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D557C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 21:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2625F894CF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fPLcGCKVtry
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 21:10:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 50B9F894CE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595625010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ed8j2LT2KsHWpolspTWtSncJAinB+1jy5yMqXWi8RFM=;
 b=R2eBq9weEcbhLlEZ365sdyLA4u/dROkoFl2Hl5rrUhsd72zQ9R6goBXvpYEOmd+73JTPyI
 np2drtJDKkZUDQv+3bjwotDAA5PjAaUFN1aIr3A9BPu3bJXettINZSeNsG14QYlhTteiQE
 wpRdACLVQl/oLc0/dLPSU7Cauew0I/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-4oQL6yaXMw6-6arlXRKcGw-1; Fri, 24 Jul 2020 17:10:08 -0400
X-MC-Unique: 4oQL6yaXMw6-6arlXRKcGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 794CD1005504;
 Fri, 24 Jul 2020 21:10:06 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 959296FEFE;
 Fri, 24 Jul 2020 21:10:02 +0000 (UTC)
Subject: Re: [PATCH v4 6/6] powerpc: implement smp_cond_load_relaxed
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200724131423.1362108-1-npiggin@gmail.com>
 <20200724131423.1362108-7-npiggin@gmail.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <1d24ef18-963b-4e26-2798-68bfe1350167@redhat.com>
Date: Fri, 24 Jul 2020 17:10:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200724131423.1362108-7-npiggin@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-arch@vger.kernel.org, Anton Blanchard <anton@ozlabs.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Will Deacon <will@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 7/24/20 9:14 AM, Nicholas Piggin wrote:
> This implements smp_cond_load_relaed with the slowpath busy loop using the

Nit: "smp_cond_load_relaxed"

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
