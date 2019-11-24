Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331A10859D
	for <lists.virtualization@lfdr.de>; Mon, 25 Nov 2019 00:37:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CCACD2035C;
	Sun, 24 Nov 2019 23:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5gb-1OiVFd7; Sun, 24 Nov 2019 23:37:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0A3B720031;
	Sun, 24 Nov 2019 23:37:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA4D0C0878;
	Sun, 24 Nov 2019 23:37:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55FEBC0878
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 40446858B5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bz9-CxEWPqn0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:37:23 +0000 (UTC)
X-Greylist: delayed 00:33:24 by SQLgrey-1.7.6
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ACE1F8523B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 23:37:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id j12so5577054plt.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Nov 2019 15:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=6we/MzgfhyrkDi1CPOUTtTgeIKvvzsxgig47t8jJM8Y=;
 b=OEtVeEEsQDSTgHMJqp7VqvE8uzd0KsJDG/6U5B9xDGR+tD3BkP+zbNLwz1ZiWmA00Q
 yy4vDEjHrvDB4haPaWtrGoYi2e2c2JY4hbX4tS3m5zNc5les6QcVrWZNGuRs6PoNU1cQ
 1gZnTLtuN7c1lxQPrhM6iBLYPZ/Ka2ZkPmQY1fU7n1vpXsny1fTXFEd8ApPNT+HjGOu4
 jAdWLxV5D+rtihHjDK7irsel13mbrNwxnCF2N00XBgKXfpJPqSPhbWWLmlCxKPVxpBeK
 65sXZHduK21B32XKwpPGhgTLjiZAHHCrllwOzZ2Bp46wTa5IwugxdToCN4W6+kcZ2z4f
 d7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=6we/MzgfhyrkDi1CPOUTtTgeIKvvzsxgig47t8jJM8Y=;
 b=tKSN8fpj+vIFd0lZdIZrsOT5yAziQ9U04Jz0cIzyqrE6wNWtadL7rBnfaN6lfOmutf
 A2Xa3ylhF0RjmzlMnUep0QDT/ik7ozDNG6S2I1mXX5tip5fKJVvnkyqAMET4WAM4MoKV
 qxws8Mc6kD6SZ5b02LDfQ8yF2OI0uTDe0VH7LxwCRvkz2MALEhnXVUQbTeVJXC2GrV5O
 IWtRFcaDV7MJLhLUe9VnmVj/Xha7/JUMuJDwZ2WSXqClN9W4IP1mFdR9+gMNsU+9Yr9a
 4U2bXbj7g3KQsGd4CBuTD1uHGXenJYerG0aJK96D3jjaVBtfUEl53Kv4WUtY+00mDwWq
 h78w==
X-Gm-Message-State: APjAAAXRreSdQmyRS7041aF87pikvAiS5JuP5ISkDQnwemZpeCXQharY
 +k5+RPQ2BhDHVyq42eXuWLmSqQ==
X-Google-Smtp-Source: APXvYqwrsOTKn/ZZp7dWj0yzsZ5TxKqoMOSF7LaZ9WDKFYyqpdHlEzTYHdnWDOaTFkZWffSFTohBdw==
X-Received: by 2002:a17:90a:a612:: with SMTP id
 c18mr35029024pjq.49.1574638643235; 
 Sun, 24 Nov 2019 15:37:23 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id e7sm5525228pfi.29.2019.11.24.15.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2019 15:37:23 -0800 (PST)
Date: Sun, 24 Nov 2019 15:37:17 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next v2] drivers: net: virtio_net: Implement a
 dev_watchdog handler
Message-ID: <20191124153717.6edefa85@cakuba.netronome.com>
In-Reply-To: <20191124182426-mutt-send-email-mst@kernel.org>
References: <20191122013636.1041-1-jcfaracco@gmail.com>
 <20191122052506-mutt-send-email-mst@kernel.org>
 <CAENf94KX1XR4_KXz9KLZQ09Ngeaq2qzYY5OE68xJMXMu13SuEg@mail.gmail.com>
 <20191124100157-mutt-send-email-mst@kernel.org>
 <20191124164411-mutt-send-email-mst@kernel.org>
 <20191124150352.5cab3209@cakuba.netronome.com>
 <20191124182426-mutt-send-email-mst@kernel.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Daiane Mendes <dnmendes76@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Julio Faracco <jcfaracco@gmail.com>, "David S.
 Miller" <davem@davemloft.net>
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

On Sun, 24 Nov 2019 18:29:49 -0500, Michael S. Tsirkin wrote:
> netdev: pass the stuck queue to the timeout handler
> 
> This allows incrementing the correct timeout statistic without any mess.
> Down the road, devices can learn to reset just the specific queue.

FWIW

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
