Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FCA142816
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 11:17:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C61F843EE;
	Mon, 20 Jan 2020 10:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfvSoOS1Wxiu; Mon, 20 Jan 2020 10:17:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A69F0843ED;
	Mon, 20 Jan 2020 10:17:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91371C0174;
	Mon, 20 Jan 2020 10:17:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E739DC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 10:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E2EE684408
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 10:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCZjy0VGJ95L
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 10:17:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E18C5843ED
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579515461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Kn3eF1bDp58ABo+Z+VK7m/se8AJ6JmDqRXHpdzmrrQ=;
 b=Q+tTwDtaSHnqqY64POEyjnwS9KK5bOH6X7QHqRM8LUndCvcKzOEHjCifd/4GtSI/CjsD9S
 Yy1H1JNPqq6wQJjJ2g21VClLV5CwwetoNoKhkbsoifAZ+Dc3WrCMM89IqunWmObAwuZ+eO
 kziGDadr6/u+UX5820GaB8EfohCpIms=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-fjq27R2rMw6toiSAUlNjYA-1; Mon, 20 Jan 2020 05:17:40 -0500
Received: by mail-wm1-f72.google.com with SMTP id t16so3546361wmt.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 02:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Kn3eF1bDp58ABo+Z+VK7m/se8AJ6JmDqRXHpdzmrrQ=;
 b=HXIs7VhVUQFBy6gA7765PwioYDmM0ZmxnK3r5QI8Tauzm4XwdAfOgkThCuZwxjPlpf
 MPQR8f2hzajEbaU7g+0hExRs8KGhbEu0fzOaUogTvQF7p2OsIqY7D72oZKhY2CtWb6d0
 gV8a69qWRdVJUJBdjayC+RnfxDnPsnwvj2TTa/T8uq7in2ywWf4sS+2ZimdcNkuIa6vQ
 f6KvfBfuFIisuXw9nLhHXUmSVIyhNkWw7Ufc2xacg/8n1ftq/46xgsDeQSy5A9WYeLms
 kEjYuCrLVfzLXUcUPu/wV2X+1BY5P9l7D0S0DqIEDwiAWEzIGjslGcNP3sQP1zsPw7Un
 Mzng==
X-Gm-Message-State: APjAAAUcON8FTl0G2dx1D4WkOQybdxF1YaDMNmGfpXHY1isOXgZxALnt
 h3nXUsNO2IJLqkJ7HpaQkVys3YCMjhXKCH0joTaZDxmZLBWZVMeLKPZY/W7cCiD3Q9TYCGaqUi8
 VAnvf4Uuo5FVmrhDG160naqTGcyqqsOf3y0LqMgupbQ==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr17204960wrs.222.1579515459311; 
 Mon, 20 Jan 2020 02:17:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8nPgpJZeiHtCAtqFdRM5avjMVn14ZlpARF6xuxaOm5EpPLbYY6JuPnFuxmQoQgypkH/rg3g==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr17204936wrs.222.1579515459017; 
 Mon, 20 Jan 2020 02:17:39 -0800 (PST)
Received: from steredhat (host84-49-dynamic.31-79-r.retail.telecomitalia.it.
 [79.31.49.84])
 by smtp.gmail.com with ESMTPSA id p18sm22504644wmb.8.2020.01.20.02.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 02:17:38 -0800 (PST)
Date: Mon, 20 Jan 2020 11:17:35 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200120101735.uyh4o64gb4njakw5@steredhat>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
MIME-Version: 1.0
In-Reply-To: <20200120.100610.546818167633238909.davem@davemloft.net>
X-MC-Unique: fjq27R2rMw6toiSAUlNjYA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, decui@microsoft.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 jhansen@vmware.com
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

On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> Date: Thu, 16 Jan 2020 18:24:26 +0100
> 
> > This patch adds 'netns' module param to enable this new feature
> > (disabled by default), because it changes vsock's behavior with
> > network namespaces and could break existing applications.
> 
> Sorry, no.
> 
> I wonder if you can even design a legitimate, reasonable, use case
> where these netns changes could break things.

I forgot to mention the use case.
I tried the RFC with Kata containers and we found that Kata shim-v1
doesn't work (Kata shim-v2 works as is) because there are the following
processes involved:
- kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
  passes it to qemu
- kata-shim (runs in a container) wants to talk with the guest but the
  vsock device is assigned to the init_netns and kata-shim runs in a
  different netns, so the communication is not allowed

But, as you said, this could be a wrong design, indeed they already
found a fix, but I was not sure if others could have the same issue.

In this case, do you think it is acceptable to make this change in
the vsock's behavior with netns and ask the user to change the design?

> 
> I am totally against adding a module parameter for this, it's
> incredibly confusing for users and will create a test scenerio
> that is strongly less likely to be covered.
> 

Got it, I'll remove the module parameter!

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
