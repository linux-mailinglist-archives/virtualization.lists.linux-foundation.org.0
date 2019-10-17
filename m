Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E34DB5C0
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 20:19:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F3E9BB3;
	Thu, 17 Oct 2019 18:19:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15482AD8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 18:19:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B5553608
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 18:19:43 +0000 (UTC)
Received: from localhost (unknown [192.55.54.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7436B20659;
	Thu, 17 Oct 2019 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571336383;
	bh=d2CkK/TjWefe+aETPDcliT8tW3ji3ywfXQM4uR0Zey8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdgltpGxueQH9B2zsQdKdVywPuJRGbeBqRqgfZUvqHWQ6Cmkpe9L+xCcSRtaFdtiY
	bccFMNwTuPX3nTL4O/U2gYFyU/WLlgZymFynhRPQVfJ0DKc82IcWePUP/yV1qdJma9
	wXtDiK3hzot8f4JkLeLC+5eB35zIaB9Nt/5A75Ks=
Date: Thu, 17 Oct 2019 11:19:43 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH RFC 2/3] usb, kcov: collect coverage from hub_event
Message-ID: <20191017181943.GC1094415@kroah.com>
References: <cover.1571333592.git.andreyknvl@google.com>
	<1b30d1c9e7f86c25425c5ee53d7facede289608e.1571333592.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b30d1c9e7f86c25425c5ee53d7facede289608e.1571333592.git.andreyknvl@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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

On Thu, Oct 17, 2019 at 07:44:14PM +0200, Andrey Konovalov wrote:
> This patch adds kcov_remote_start/kcov_remote_stop annotations to the
> hub_event function, which is responsible for processing events on USB
> buses, in particular events that happen during USB device enumeration.
> Each USB bus gets a unique id, which can be used to attach a kcov device
> to a particular USB bus for coverage collection.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  drivers/usb/core/hub.c    | 4 ++++
>  include/linux/kcov.h      | 1 +
>  include/uapi/linux/kcov.h | 7 +++++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 236313f41f4a..03a40e41b099 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5374,6 +5374,8 @@ static void hub_event(struct work_struct *work)
>  	hub_dev = hub->intfdev;
>  	intf = to_usb_interface(hub_dev);
>  
> +	kcov_remote_start(kcov_remote_handle_usb(hdev->bus->busnum));
> +
>  	dev_dbg(hub_dev, "state %d ports %d chg %04x evt %04x\n",
>  			hdev->state, hdev->maxchild,
>  			/* NOTE: expects max 15 ports... */
> @@ -5480,6 +5482,8 @@ static void hub_event(struct work_struct *work)
>  	/* Balance the stuff in kick_hub_wq() and allow autosuspend */
>  	usb_autopm_put_interface(intf);
>  	kref_put(&hub->kref, hub_release);
> +
> +	kcov_remote_stop();
>  }
>  
>  static const struct usb_device_id hub_id_table[] = {
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index 702672d98d35..38a47e0b67c2 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -30,6 +30,7 @@ void kcov_task_exit(struct task_struct *t);
>  /*
>   * Reserved handle ranges:
>   * 0000000000000000 - 0000ffffffffffff : common handles
> + * 0001000000000000 - 0001ffffffffffff : USB subsystem handles

So how many bits are you going to have for any in-kernel tasks?  Aren't
you going to run out quickly?


>   */
>  void kcov_remote_start(u64 handle);
>  void kcov_remote_stop(void);
> diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> index 46f78f716ca9..45c9ae59cebc 100644
> --- a/include/uapi/linux/kcov.h
> +++ b/include/uapi/linux/kcov.h
> @@ -43,4 +43,11 @@ enum {
>  #define KCOV_CMP_SIZE(n)        ((n) << 1)
>  #define KCOV_CMP_MASK           KCOV_CMP_SIZE(3)
>  
> +#define KCOV_REMOTE_HANDLE_USB  0x0001000000000000ull
> +
> +static inline __u64 kcov_remote_handle_usb(unsigned int bus)
> +{
> +	return KCOV_REMOTE_HANDLE_USB + (__u64)bus;
> +}

Why is this function in a uapi .h file?  What userspace code would call
this?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
