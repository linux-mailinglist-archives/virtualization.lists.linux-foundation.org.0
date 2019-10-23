Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F7E264F
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 00:22:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 661D9CAF;
	Wed, 23 Oct 2019 22:22:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 21706B50
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 22:22:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AD46A8A2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 22:22:17 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E28112173B;
	Wed, 23 Oct 2019 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571869337;
	bh=6Rbgh0+34r9cF1cQinXhfyAQRKfEhqrc9mI/6IrPXxw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Juvdf1ok/t8o2WngMzUbP/+XV4ybqjNmijrY09FnB08RG3NGsoLsiamQL+maUpXmO
	tKJY8Zegt9n+3CzBYC60X379EO+qeCI6N7reZCJGGNqO70y5xuAHo77ekSmWKvri44
	mwPmicsQP0sC+coJFExV89IehHmBhcoxII5e8jlM=
Date: Wed, 23 Oct 2019 15:22:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v2 1/3] kcov: remote coverage support
Message-Id: <20191023152216.796aeafd832ba5351d86d3ca@linux-foundation.org>
In-Reply-To: <beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
References: <cover.1571844200.git.andreyknvl@google.com>
	<beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Marco Elver <elver@google.com>, Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Windsor <dwindsor@gmail.com>
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

On Wed, 23 Oct 2019 17:24:29 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:

> This patch adds background thread coverage collection ability to kcov.
> 
> With KCOV_ENABLE coverage is collected only for syscalls that are issued
> from the current process. With KCOV_REMOTE_ENABLE it's possible to collect
> coverage for arbitrary parts of the kernel code, provided that those parts
> are annotated with kcov_remote_start()/kcov_remote_stop().
> 
> This allows to collect coverage from two types of kernel background
> threads: the global ones, that are spawned during kernel boot and are
> always running (e.g. USB hub_event()); and the local ones, that are
> spawned when a user interacts with some kernel interface (e.g. vhost
> workers).
> 
> To enable collecting coverage from a global background thread, a unique
> global handle must be assigned and passed to the corresponding
> kcov_remote_start() call. Then a userspace process can pass a list of such
> handles to the KCOV_REMOTE_ENABLE ioctl in the handles array field of the
> kcov_remote_arg struct. This will attach the used kcov device to the code
> sections, that are referenced by those handles.
> 
> Since there might be many local background threads spawned from different
> userspace processes, we can't use a single global handle per annotation.
> Instead, the userspace process passes a non-zero handle through the
> common_handle field of the kcov_remote_arg struct. This common handle gets
> saved to the kcov_handle field in the current task_struct and needs to be
> passed to the newly spawned threads via custom annotations. Those threads
> should in turn be annotated with kcov_remote_start()/kcov_remote_stop().
> 
> Internally kcov stores handles as u64 integers. The top byte of a handle
> is used to denote the id of a subsystem that this handle belongs to, and
> the lower 4 bytes are used to denote a handle id within that subsystem.
> A reserved value 0 is used as a subsystem id for common handles as they
> don't belong to a particular subsystem. The bytes 4-7 are currently
> reserved and must be zero. In the future the number of bytes used for the
> subsystem or handle ids might be increased.
> 
> When a particular userspace proccess collects coverage by via a common
> handle, kcov will collect coverage for each code section that is annotated
> to use the common handle obtained as kcov_handle from the current
> task_struct. However non common handles allow to collect coverage
> selectively from different subsystems.
> 
> ...
>
> +static struct kcov_remote *kcov_remote_add(struct kcov *kcov, u64 handle)
> +{
> +	struct kcov_remote *remote;
> +
> +	if (kcov_remote_find(handle))
> +		return ERR_PTR(-EEXIST);
> +	remote = kmalloc(sizeof(*remote), GFP_ATOMIC);
> +	if (!remote)
> +		return ERR_PTR(-ENOMEM);
> +	remote->handle = handle;
> +	remote->kcov = kcov;
> +	hash_add(kcov_remote_map, &remote->hnode, handle);
> +	return remote;
> +}
> +
>
> ...
>
> +		spin_lock(&kcov_remote_lock);
> +		for (i = 0; i < remote_arg->num_handles; i++) {
> +			kcov_debug("handle %llx\n", remote_arg->handles[i]);
> +			if (!kcov_check_handle(remote_arg->handles[i],
> +						false, true, false)) {
> +				spin_unlock(&kcov_remote_lock);
> +				kcov_disable(t, kcov);
> +				return -EINVAL;
> +			}
> +			remote = kcov_remote_add(kcov, remote_arg->handles[i]);
> +			if (IS_ERR(remote)) {
> +				spin_unlock(&kcov_remote_lock);
> +				kcov_disable(t, kcov);
> +				return PTR_ERR(remote);
> +			}
> +		}

It's worrisome that this code can perform up to 65536 GFP_ATOMIC
allocations without coming up for air.  The possibility of ENOMEM or of
causing collateral problems is significant.  It doesn't look too hard
to change this to use GFP_KERNEL?

> +u64 kcov_common_handle(void)
> +{
> +	return current->kcov_handle;
> +}

I don't immediately understand what this "common handle" thing is all about. 
Code is rather lacking in this sort of high-level commentary?


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
