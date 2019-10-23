Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 762A6E1462
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 10:37:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F1F1C6E;
	Wed, 23 Oct 2019 08:37:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E7D5C3E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:37:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 38D4487B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:37:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t8so13575485qtc.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8lz7pb4FteEgyJv9IPQ/OLCtPnphrxWGvxhOP9Cg5xg=;
	b=JwTjN6vydN0+Zf4u7pB30rwoE59an2gXmw4CK43Gw2mUgwv6sHB8dRu5ef+CPKrKi9
	t37NRMXY7Pqn+GOXFnQVRUhDon6l/NVQ8pA0BemeHOS2xV5gnJeOluyURTVwqiqciHLr
	qDsbygaUpKyOoJQGtYGQCZ1Z1qPmuIERBA+CkHYIsho9310tefDA69PATQdcjEBUxKvZ
	zccwGPi/rBKb1ABlUBTM4DzoW7/ny0B2e4mksE9SWdW/VXPMMYWRkgwBwgTZmF6XoI/2
	9Klci3Rpbj2E75wUXAhDRIwV2xUCPGOaB+CkTyurziCQ8SokD8YBhlXIMeY8vmxGNMh9
	CpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8lz7pb4FteEgyJv9IPQ/OLCtPnphrxWGvxhOP9Cg5xg=;
	b=ZGbqQP4mjhjy7HZq/Uw6+XkqT9wVCHJFPeL93lqgbso7Ilk3GrF5NFbZitgGKRi/5h
	2RxJzI36Ix2uYJsYUkTYV7GbfVF1sYYnYuihPGJnOGzL63FeqN1PIQ8C24xxQzkWIcsn
	Z5923faIQp+pd/WEJ9oqmhLLR6INCTWYBwlp3PDDAyADMLpdCd07vMyVx+hLJ9hAqs9w
	7EFY0Oh+D6u764MobNTQ4o96Pr/fqsqw6koqAo13Q/wFSsMnEkUlkO6sg02DqJ3q7coM
	/EDnXx/pbc3qXaDPy8YNdpUa1i6hsdxTjIptke3kJtEG1GpOZzUAAZt4ba2dC2rVaVdU
	Dzig==
X-Gm-Message-State: APjAAAVT88dFv9/qRQ3t3P/6x4zc9HOPSx38ePhBt4NgiEXX04SxSKpD
	C2c8YsXLVySXjey+VKKXz99DrzYxsFIrwTVx0ITcMg==
X-Google-Smtp-Source: APXvYqzx+Vk1M8As38RQ4hIHR6mJF2kC4m1fQbj0srob4XtBiTnVVZbS/2BQAN6f9QjBuuoyoWNpTyhH+FFLQW+4r9s=
X-Received: by 2002:a0c:fec3:: with SMTP id z3mr7697922qvs.122.1571819843712; 
	Wed, 23 Oct 2019 01:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571762488.git.andreyknvl@google.com>
In-Reply-To: <cover.1571762488.git.andreyknvl@google.com>
Date: Wed, 23 Oct 2019 10:37:12 +0200
Message-ID: <CACT4Y+aUf5_+U90BD=1FsS1vVFrH=kskkUJWFyg2cdeRjL1LVw@mail.gmail.com>
Subject: Re: [PATCH 0/3] kcov: collect coverage from usb and vhost
To: Andrey Konovalov <andreyknvl@google.com>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	KVM list <kvm@vger.kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
	netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Elena Reshetova <elena.reshetova@intel.com>,
	David Windsor <dwindsor@gmail.com>
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
From: Dmitry Vyukov via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Oct 22, 2019 at 6:46 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patchset extends kcov to allow collecting coverage from the USB
> subsystem and vhost workers. See the first patch description for details
> about the kcov extension. The other two patches apply this kcov extension
> to USB and vhost.
>
> These patches have been used to enable coverage-guided USB fuzzing with
> syzkaller for the last few years, see the details here:
>
> https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md
>
> This patchset has been pushed to the public Linux kernel Gerrit instance:
>
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/1524

Oh, so much easier to review with side-by-side diffs, context and
smart in-line colouring!

> Changes from RFC v1:
> - Remove unnecessary #ifdef's from drivers/vhost/vhost.c.
> - Reset t->kcov when area allocation fails in kcov_remote_start().
> - Use struct_size to calculate array size in kcov_ioctl().
> - Add a limit on area_size in kcov_remote_arg.
> - Added kcov_disable() helper.
> - Changed encoding of kcov remote handle ids, see the documentation.
> - Added a comment reference for kcov_sequence task_struct field.
> - Change common_handle type to u32.
> - Add checks for handle validity into kcov_ioctl_locked() and
>     kcov_remote_start().
> - Updated documentation to reflect the changes.
>
> Andrey Konovalov (3):
>   kcov: remote coverage support
>   usb, kcov: collect coverage from hub_event
>   vhost, kcov: collect coverage from vhost_worker
>
>  Documentation/dev-tools/kcov.rst | 120 ++++++++
>  drivers/usb/core/hub.c           |   5 +
>  drivers/vhost/vhost.c            |   6 +
>  drivers/vhost/vhost.h            |   1 +
>  include/linux/kcov.h             |   6 +
>  include/linux/sched.h            |   6 +
>  include/uapi/linux/kcov.h        |  20 ++
>  kernel/kcov.c                    | 464 ++++++++++++++++++++++++++++---
>  8 files changed, 593 insertions(+), 35 deletions(-)
>
> --
> 2.23.0.866.gb869b98d4c-goog
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
