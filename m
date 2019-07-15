Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 84314699B1
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 19:28:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AB53CF01;
	Mon, 15 Jul 2019 17:28:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ECF2CCC6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:28:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 90170892
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:28:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0DA09217F4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563211699;
	bh=9E0ZytSBTx4ARSQXikFxFqt26WTjZZg9YEuzJOE71XY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CvQyWlBHJkYMir6qOJgjnjkTNYuDngouMYZ2nM0oVQkb9xzSIvJe/qiRYXQDXjMPB
	7lVAOCBykBf4qxlzEEPF2ZuEcjSLtiH9TBJOFmQnrCvchgMrQ5KDFopNebDD+yulBB
	qN0sJe/fvbW15UKisT/n89ScJ8kZ0+b1BwOd14yg=
Received: by mail-wr1-f46.google.com with SMTP id f9so17944705wre.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 10:28:18 -0700 (PDT)
X-Gm-Message-State: APjAAAUgx/MysKZ1tc0IohrwvnxQJAMmeIMtghjuDTwoL09ogJlFGKbT
	Ql2QYzKXBN3cpZbz/UUqUGKATW0PFJU8jZTwR4GGZQ==
X-Google-Smtp-Source: APXvYqz1bcfnUp0J1AeVS+zB00SN2CvvFrutc7PmnWTPZk+ekXhDQO1E9JPmdpKMMm6yj0t8VwFOW7L195SLye6jbF0=
X-Received: by 2002:adf:cf02:: with SMTP id o2mr11075557wrj.352.1563211697557; 
	Mon, 15 Jul 2019 10:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190715113739.17694-1-jgross@suse.com>
	<87y30zfe9z.fsf@linux.intel.com>
In-Reply-To: <87y30zfe9z.fsf@linux.intel.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 15 Jul 2019 10:28:06 -0700
X-Gmail-Original-Message-ID: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
Message-ID: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove 32-bit Xen PV guest support
To: Andi Kleen <ak@linux.intel.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	X86 ML <x86@kernel.org>, Alok Kataria <akataria@vmware.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Jul 15, 2019 at 9:34 AM Andi Kleen <ak@linux.intel.com> wrote:
>
> Juergen Gross <jgross@suse.com> writes:
>
> > The long term plan has been to replace Xen PV guests by PVH. The first
> > victim of that plan are now 32-bit PV guests, as those are used only
> > rather seldom these days. Xen on x86 requires 64-bit support and with
> > Grub2 now supporting PVH officially since version 2.04 there is no
> > need to keep 32-bit PV guest support alive in the Linux kernel.
> > Additionally Meltdown mitigation is not available in the kernel running
> > as 32-bit PV guest, so dropping this mode makes sense from security
> > point of view, too.
>
> Normally we have a deprecation period for feature removals like this.
> You would make the kernel print a warning for some releases, and when
> no user complains you can then remove. If a user complains you can't.
>

As I understand it, the kernel rules do allow changes like this even
if there's a complaint: this is a patch that removes what is
effectively hardware support.  If the maintenance cost exceeds the
value, then removal is fair game.  (Obviously we weight the value to
preserving compatibility quite highly, but in this case, Xen dropped
32-bit hardware support a long time ago.  If the Xen hypervisor says
that 32-bit PV guest support is deprecated, it's deprecated.)

That being said, a warning might not be a bad idea.  What's the
current status of this in upstream Xen?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
