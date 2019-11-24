Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B571082FE
	for <lists.virtualization@lfdr.de>; Sun, 24 Nov 2019 11:52:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3792585C5E;
	Sun, 24 Nov 2019 10:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNMRxkTgYRRl; Sun, 24 Nov 2019 10:52:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 51CB185D52;
	Sun, 24 Nov 2019 10:52:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3531DC0878;
	Sun, 24 Nov 2019 10:52:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FD5AC0878
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 10:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3494D20371
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 10:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhvCIGjT6YEe
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 10:52:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id BF6D62036E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574592733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgrqyGrI4wz4JE0efwdw2KoDDevv1GGFzKxHMz7NT+E=;
 b=d00CO9poPDYL0TastioSu38GRz9KjeEaCYjubz3lR7KTttFw0a3oOM9XOHWxOmGGwVpXv+
 4ihcJaMF86bPjf4ItmEIJGO3NL2AoRv1RqJEAGTjwdnDUupa1R4HGsy5eiLx+t3g0OJNFu
 NpUTvVPIh1Ji6Jl+8zKbxfVN8tK31AE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-G6Vl41H4OoOB_JgjnfLrdQ-1; Sun, 24 Nov 2019 05:52:09 -0500
Received: by mail-qt1-f198.google.com with SMTP id e2so8187987qtq.11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 02:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aYTE+708WYU/v6e61/u6H0iTp+/IB5KOl36q0rPST20=;
 b=uW4xQZrQHtL7FwqVNfjgZO73aOzRkgC9A89LeUyLRzToGMNIi9P7G8IT5r4Yidr6ei
 YwrmQkNt863jeYbaPGn+FHgW3vD7RePwqhfs3CDlgIi8414jzk80RZixGvZbpNHL6rpF
 plOVH7gG1HEzAnALsF/Ue7MeYK3wvovzmzad+qemL9FyT6OzggXOFy6HOh8mJm2uQauB
 BvMXIEY5k447h3NSfDeBus5jUHJEEVzkfoPGWOaXy3qPX264ukA1VTBxNx87mHkycFf7
 fKT05EYXb/kwVPoAKBo6Vv3A6x7x5qG2YeJFsqc0CQzW29ueIB3YgX49Y7n8jhooxd/3
 2Btg==
X-Gm-Message-State: APjAAAUaZFpfzvWMF1sXlAJPovX4cpBPMYeVcaVvtfRrUUBBrK0agbAF
 gtkADasyCKUXwNwJdYbggSxT0J1vueWGybh+Hky1hztwrfLLy3VIQjG1PBFlLI02JivtDJO34Wi
 WHFuE5Sdy2m19qbWNb/MLBiiSzWvfgPSJ7sq3Y/y7Ug==
X-Received: by 2002:a0c:fa05:: with SMTP id q5mr12215640qvn.182.1574592729397; 
 Sun, 24 Nov 2019 02:52:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZ7wVd3gE/UE/n6wQWaImHjk1yL624O9bg+Y7VbNSDbwNBANSGUiP3UWpATNi251yCQNG6IQ==
X-Received: by 2002:a0c:fa05:: with SMTP id q5mr12215627qvn.182.1574592729167; 
 Sun, 24 Nov 2019 02:52:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id x8sm1983132qtp.75.2019.11.24.02.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2019 02:52:08 -0800 (PST)
Date: Sun, 24 Nov 2019 05:52:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julio Faracco <jcfaracco@gmail.com>
Subject: Re: [PATCH net-next v2] drivers: net: virtio_net: Implement a
 dev_watchdog handler
Message-ID: <20191124054916-mutt-send-email-mst@kernel.org>
References: <20191122013636.1041-1-jcfaracco@gmail.com>
 <20191122052506-mutt-send-email-mst@kernel.org>
 <CAENf94KX1XR4_KXz9KLZQ09Ngeaq2qzYY5OE68xJMXMu13SuEg@mail.gmail.com>
 <20191122080233-mutt-send-email-mst@kernel.org>
 <CAENf94L7zU6JoM+19F+__b6W4mpe5Na=ayd+eYe4aZ+EBABmiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAENf94L7zU6JoM+19F+__b6W4mpe5Na=ayd+eYe4aZ+EBABmiA@mail.gmail.com>
X-MC-Unique: G6Vl41H4OoOB_JgjnfLrdQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Daiane Mendes <dnmendes76@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

On Sat, Nov 23, 2019 at 08:33:40PM -0200, Julio Faracco wrote:
> >
> > netdev: pass the stuck queue to the timeout handler
> >
> > This allows incrementing the correct timeout statistic without any mess.
> > Down the road, devices can learn to reset just the specific queue.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > Warning: untested.
> >
> 
> Question...
> Wouldn't be better to create a module parameter instead change the
> function scope?

Passing the value in a global variable? That fails to be reentrant ...

> I'm asking it because how many modules would effectively take advantage of it?

The cost is effectively 0 though.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
