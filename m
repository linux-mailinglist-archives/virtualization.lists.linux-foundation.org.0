Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A72126BA
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 16:49:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 710CA26EB3;
	Thu,  2 Jul 2020 14:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EScEGWwtjKuo; Thu,  2 Jul 2020 14:49:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E1D8524F92;
	Thu,  2 Jul 2020 14:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAB53C0733;
	Thu,  2 Jul 2020 14:49:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF21BC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A69418A79E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rzZHlQl1wVm
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:49:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 182138A79C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:49:00 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i4so29110780iov.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4VXI9uP014tYHa4Tj77JYdAu3duCFmr1FkN+vT8NsI=;
 b=FoyObNL92iyVLE061Hvbm+xq+zoeDIpNkTcIUjGaXkrsBOkS1ywIpFNY/kdIw7OPms
 EWzPxJOpa7MJzcQI1tMfv/vtfU3yNUt4ZETFGw4iwn/fsT9oFyCTnaKIEPlG/LQW7v/F
 cuJdCxfF3FjsQCpeWWNc/QExbhhNa5rnBjX3vciDAAGLevquONjrb00s+NcBsQlgv81f
 e2GGhZ5MMK992CtMz1m3IsNTvXT5qf752JhUqT9DMnFntgzsoYNJScekoqqQ9tlo3OqY
 saoknjuOJ2JQx0GcMqJd6BehD+PelFtZ31gCN2UQkckHDMAyNoGZFxYKfdmuvXR7NZJY
 oPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4VXI9uP014tYHa4Tj77JYdAu3duCFmr1FkN+vT8NsI=;
 b=cqDd/r1AyMQEkwh8zlcD6qdGbRKqi0LeoT8VOZJ8e5/+m0NCL8Z9YjjypPCV+1XOoq
 hqAthnqCKuX8zScqyIfqQtntSoFnwd/5OrpAqPEGHK8nw3hYeBfO8gd2LuqPnpEs2aBG
 Q4v3Pw2MYZW7tSAAeqshqrG10Z8ouk2YbdDcW+YUumEC1dPrHhgFtWrpvRJAv7dOJeq3
 GZldQ8yVMYauNq3m8YvDyR/qZ24ensyCOJjpmm03COL929nBAyiT2FSExYgLTSxNWVi0
 zpXf/Jz1yMKOgqXja61WF73vqnhyUnkb4qttLT8RzMbl5uLVk6VAY9LMspz/rlf70MlT
 c2DA==
X-Gm-Message-State: AOAM531oxGTjsNplQ2NNplzjIDTavoPrEwr0/JzsjGQRB4sbQ69FF4KA
 UphViyB/tOq7pcyEBZVjnkEbDBA/UhnNaHC6Rw==
X-Google-Smtp-Source: ABdhPJyVQXzx0lAtmUN3BtC8Tkcr13el8baae8+TSIqX/1DCH6FcNUO6wM89BF5N7w1XA1rAyO0/vpSkh2gr5Elwbuo=
X-Received: by 2002:a5d:849a:: with SMTP id t26mr7826768iom.22.1593701339267; 
 Thu, 02 Jul 2020 07:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200701110650.16172-1-jgross@suse.com>
In-Reply-To: <20200701110650.16172-1-jgross@suse.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Thu, 2 Jul 2020 10:48:48 -0400
Message-ID: <CAMzpN2hvK2T7Qje51MPjMyTggxT7_=EFnt7gAmJEa1Zq+t3LtA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Remove 32-bit Xen PV guest support
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Wed, Jul 1, 2020 at 7:07 AM Juergen Gross <jgross@suse.com> wrote:
>
> The long term plan has been to replace Xen PV guests by PVH. The first
> victim of that plan are now 32-bit PV guests, as those are used only
> rather seldom these days. Xen on x86 requires 64-bit support and with
> Grub2 now supporting PVH officially since version 2.04 there is no
> need to keep 32-bit PV guest support alive in the Linux kernel.
> Additionally Meltdown mitigation is not available in the kernel running
> as 32-bit PV guest, so dropping this mode makes sense from security
> point of view, too.

One thing that you missed is removing VDSO_NOTE_NONEGSEG_BIT from
vdso32/note.S.  With that removed there is no difference from the
64-bit version.

Otherwise this series looks good to me.
--
Brian Gerst
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
