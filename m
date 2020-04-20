Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8EE1B0E16
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 16:16:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0331787D75;
	Mon, 20 Apr 2020 14:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYIGqjGoVYU0; Mon, 20 Apr 2020 14:16:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 59F7687D46;
	Mon, 20 Apr 2020 14:16:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 484CFC0177;
	Mon, 20 Apr 2020 14:16:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C263C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 862A1862F4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leDV3MHXUyor
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:16:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 711C086018
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587392178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JkxIFVIohEorxeTZe98++uLsQqk7YmDIx4Z7KvJXfYk=;
 b=J/+vovtH4rUFhy1acS3xf4cXditJ6DyOfYzH0wHtbd8mBrZZZWBw2LErnFHPtLcUseW8Pc
 R5TEJAvI4Ied6rVXUK7oOGRmW5gvmGUoYbSt68dLsaSsurj2JYnp1NpCXDpuRF3q9k7zpe
 QipqJ2id23oTrCvRdnA2qRDYknPOYh4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-Pp0Ffp2lMQK318FspSnolQ-1; Mon, 20 Apr 2020 10:16:16 -0400
X-MC-Unique: Pp0Ffp2lMQK318FspSnolQ-1
Received: by mail-wm1-f69.google.com with SMTP id b203so3545325wmd.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 07:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JkxIFVIohEorxeTZe98++uLsQqk7YmDIx4Z7KvJXfYk=;
 b=QD46bML5Y8BuhYNKiEvu8x1HMM/VdgtN/zc4iMC8tGIq6gk0HeaMjIIUWDIFCyDcgq
 kgoybynEeoG89y88oFHuTVXR1qrTUAXjCRspVE3cLJH/8Ek5X0Csw6MuloeBoigpBJqt
 LqfOhffmYGbHe7Ypml0NmPQ/w5MWkly5P9oueONbRsBHqV2iK9hFbmViwngAHIs7bWs+
 rLjO5EsSEqlXB1+m23HhU3sN40dFzdUVBbLSoSABu2RObVJB9ZE1nE2lO5ieATj3vo5L
 3s+6hWO1F1wh9vvk0d+XtpcMJxAwmu3GhmNifFXDXP3TuU8+QogZ5ENhsOsILrZCWVPA
 1fzA==
X-Gm-Message-State: AGi0Pua1WmO9mIwSNpQVFJ4MXhaESkGTcPb8MG7THTURScQQ2lFATabl
 jR1cg5fIa0YeILI8QO4Q8Q5bXV73gAvg/Sb0P/ZPaTrmNQWwRL2gqLACH8s9l7o9pesBZQRteRN
 zcZGiplpTnbxH8iuPI7CqaD60xcvfimB7znCLp3dZVQ==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr16805513wrc.20.1587392175529; 
 Mon, 20 Apr 2020 07:16:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypILEROI3x8fort+5bkMx0TZQmQ1zQlGbT1pp1O6iljI2XwZ+SmO3RgUlnhFtDZnZ7lv8EOcYQ==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr16805492wrc.20.1587392175345; 
 Mon, 20 Apr 2020 07:16:15 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id f18sm1432047wrq.29.2020.04.20.07.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:16:14 -0700 (PDT)
Date: Mon, 20 Apr 2020 10:16:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3] vhost: disable for OABI
Message-ID: <20200420101511-mutt-send-email-mst@kernel.org>
References: <20200416221902.5801-1-mst@redhat.com>
 <20200420082909.GA28749@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200420082909.GA28749@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>, kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>
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

On Mon, Apr 20, 2020 at 01:29:09AM -0700, Christoph Hellwig wrote:
> On Thu, Apr 16, 2020 at 06:20:20PM -0400, Michael S. Tsirkin wrote:
> > vhost is currently broken on the some ARM configs.
> > 
> > The reason is that that uses apcs-gnu which is the ancient OABI that is been
> > deprecated for a long time.
> > 
> > Given that virtio support on such ancient systems is not needed in the
> > first place, let's just add something along the lines of
> > 
> > 	depends on !ARM || AEABI
> > 
> > to the virtio Kconfig declaration, and add a comment that it has to do
> > with struct member alignment.
> > 
> > Note: we can't make VHOST and VHOST_RING themselves have
> > a dependency since these are selected. Add a new symbol for that.
> 
> This description is horrible.  The only interesting thing for ARM OABI
> is that it has some strange padding rules, but that isn't something
> that can't be handled.   Please spend some time looking into the issue
> and add te proper __padded annotations, we've done that elsewhere in
> the kernel and it isn't too bad - in fact it helps understanding issues
> with implicit alignment.

Yes I have a patch queued to fix it. I wanted a minimal patch for this
release though.

> And even if you have a good reason not to fix vhost (which I think you
> don't have) this changelog is just utter crap, as it fails to mention
> what the problem with ARM OABI even is.

I'll tweak that, thanks!

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
