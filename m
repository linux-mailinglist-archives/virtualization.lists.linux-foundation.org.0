Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D64E2B0F
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 09:27:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE088B88;
	Thu, 24 Oct 2019 07:27:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7833EB09
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 07:27:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02008831
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 07:27:04 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d17so21872119qto.3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rR+/2C/x3kiaj39AAUm04JfYyfeKX8N8SiuzYvghj0s=;
	b=hrzuVLf6ajJ+WcLgB9Lbeu+QpAKrWbF2mPO3sT9AzVHmiPQ8GqYWJy+AD/rywikhqB
	kIC2LFBHqmBatWlJcp+iSROqXmTBz7Dd++TJT5kItpu82Z9Gty9fgCQ4N9UWAAHbwP0F
	A4Y9IuMKaITHBf9ElHLWQpsXNa1+seMtGTfUDEwXo1HoTQN4WuLIZROZLtq9P0s3Uldb
	1eevF1n6l3IiVU0DYm0huy3PlsYWiOIvPsX6Nm7PYpi+djps9p7blVDq638WYodKNHRM
	KLn+qX1P9g6t+BtjPQywgvJJjDDsSc5C0xltydxvDS6PIejjVYDnTS07VNS5svGYtvP6
	MvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rR+/2C/x3kiaj39AAUm04JfYyfeKX8N8SiuzYvghj0s=;
	b=NHipgmRqb80Ihfelrn5TP7RSDHCF5jIutz08F2SyZpdr99y6zUxl5k2/Tqb67Rstb5
	b4UHO+sFWeb98pZu1WvPwK9yIHbGUfQcPt7NlpBuPIRDAVHiYC4F2XffRhsS9d6cYx7+
	K+aaQ76FWFqfbkeCdxLC0wjtvSf8SAnGUMBjL+lQ2qdQcsOTp0RrdSYTwrfKqLC5Scaf
	pxXoD8pYvnOCEhD0uIdEynChPJYvLawSFzaR6hNTtRuIfKsc7aMHyP85bBJ3zSO6nxcj
	DoWx7bo0p0GIVFJbvj3Gfl09YQnKZaRzDdgX1v4eFy9kNd6sDQ4KSqI+sQrbvWzkSKEm
	iYiw==
X-Gm-Message-State: APjAAAWMx9ytFAthvi4oX+tycjZ5iUsWGrM+cB9SY9rE03U5emjO2LE/
	pw3QQSg+mP5QYCXbMhmpmkArF9o6S4DrWQsgfQuUJg==
X-Google-Smtp-Source: APXvYqzLkvPiMyJIYtWQ5uRQfPL6nkIrOlG3sj9/1E1Wc1lj5bM1AzSKU18YzvgzGKdHfFrN7b/Qd0KdcTZhcyEtoVY=
X-Received: by 2002:a0c:95ca:: with SMTP id t10mr7062131qvt.22.1571902023325; 
	Thu, 24 Oct 2019 00:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571844200.git.andreyknvl@google.com>
	<beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
In-Reply-To: <beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
Date: Thu, 24 Oct 2019 09:26:52 +0200
Message-ID: <CACT4Y+a6t08RmtSYfF=3TuASx9ReCEe0Qp0AP=GbCtNyL2j+TA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kcov: remote coverage support
To: Andrey Konovalov <andreyknvl@google.com>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DOS_RCVD_IP_TWICE_B,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Marco Elver <elver@google.com>, Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, KVM list <kvm@vger.kernel.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, netdev <netdev@vger.kernel.org>,
	USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Potapenko <glider@google.com>,
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

On Wed, Oct 23, 2019 at 5:24 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patch adds background thread coverage collection ability to kcov.
...
> +static struct kcov_remote *kcov_remote_add(struct kcov *kcov, u64 handle)
> +{
> +       struct kcov_remote *remote;
> +
> +       if (kcov_remote_find(handle))
> +               return ERR_PTR(-EEXIST);
> +       remote = kmalloc(sizeof(*remote), GFP_ATOMIC);
> +       if (!remote)
> +               return ERR_PTR(-ENOMEM);
> +       remote->handle = handle;
> +       remote->kcov = kcov;
> +       hash_add(kcov_remote_map, &remote->hnode, handle);

I think it will make sense to check that there is no existing kcov
with the same handle registered. Such condition will be extremely hard
to debug based on episodically missing coverage.

...
>  void kcov_task_exit(struct task_struct *t)
>  {
>         struct kcov *kcov;
> @@ -256,15 +401,23 @@ void kcov_task_exit(struct task_struct *t)
>         kcov = t->kcov;
>         if (kcov == NULL)
>                 return;
> +
>         spin_lock(&kcov->lock);
> +       kcov_debug("t = %px, kcov->t = %px\n", t, kcov->t);
> +       /*
> +        * If !kcov->remote, this checks that t->kcov->t == t.
> +        * If kcov->remote == true then the exiting task is either:
> +        * 1. a remote task between kcov_remote_start() and kcov_remote_stop(),
> +        *    in this case t != kcov->t and we'll print a warning; or

Why? Is kcov->t == NULL for remote kcov's? May be worth mentioning in
the comment b/c it's a very condensed form to check lots of different
things at once.

Otherwise the series look good to me:

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

But Andrew's comments stand. It's possible I understand all of this
only because I already know how it works and why it works this way.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
