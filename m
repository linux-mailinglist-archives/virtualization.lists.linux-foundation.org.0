Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2321307B
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 02:36:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04DBC87A62;
	Fri,  3 Jul 2020 00:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oji5uL1dpoLp; Fri,  3 Jul 2020 00:36:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8337287A4C;
	Fri,  3 Jul 2020 00:36:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58522C0733;
	Fri,  3 Jul 2020 00:36:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95ACBC0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 00:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9140C87A4C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 00:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gv_z3s13g-X1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 00:36:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8DF2F878E1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 00:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593736575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H02gDnpUqaBFoqy+Gmqb6/mcQ7fzguEDru28MyLbZRk=;
 b=cq47F5TLkgV9BvdNcebCxJMBVjlpEDlWtIqIgkpNxfvLC/Fph2t+Seeq3WglTO0Qj0UU1c
 eWkCIejrTpaIoMFqS6UO04aR9wvjPUstCOxiIJiNRDWLzb89mGHLpmnxb1gEvuFMnPyFzm
 5q/wdaucl9Ev9Xo0FxZzfAAjT907Ygs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-GreJcrfjNq-bNoQeshMd9Q-1; Thu, 02 Jul 2020 20:36:11 -0400
X-MC-Unique: GreJcrfjNq-bNoQeshMd9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9851D1009616;
 Fri,  3 Jul 2020 00:36:09 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-121.rdu2.redhat.com [10.10.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EAD779256;
 Fri,  3 Jul 2020 00:36:07 +0000 (UTC)
Subject: Re: [PATCH 6/8] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200702074839.1057733-7-npiggin@gmail.com>
 <202007030059.nT5quxzB%lkp@intel.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <3730577a-1e14-0e3e-7f7b-0c6cb68fb1f2@redhat.com>
Date: Thu, 2 Jul 2020 20:36:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <202007030059.nT5quxzB%lkp@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, Will Deacon <will@kernel.org>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 7/2/20 12:15 PM, kernel test robot wrote:
> Hi Nicholas,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on tip/locking/core v5.8-rc3 next-20200702]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-=
queued-spinlocks-and-rwlocks/20200702-155158
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=
 next
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Dpowerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     kernel/locking/lock_events.c:61:16: warning: no previous prototype fo=
r 'lockevent_read' [-Wmissing-prototypes]
>        61 | ssize_t __weak lockevent_read(struct file *file, char __user =
*user_buf,
>           |                ^~~~~~~~~~~~~~
>     kernel/locking/lock_events.c: In function 'skip_lockevent':
>>> kernel/locking/lock_events.c:126:12: error: implicit declaration of fun=
ction 'pv_is_native_spin_unlock' [-Werror=3Dimplicit-function-declaration]
>       126 |   pv_on =3D !pv_is_native_spin_unlock();
>           |            ^~~~~~~~~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
>
> vim +/pv_is_native_spin_unlock +126 kernel/locking/lock_events.c

I think you will need to add the following into =

arch/powerpc/include/asm/qspinlock_paravirt.h:

static inline pv_is_native_spin_unlock(void)
{
 =A0=A0=A0 return !is_shared_processor();
}

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
