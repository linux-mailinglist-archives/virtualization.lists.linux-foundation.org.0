Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC881AD26D
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 23:58:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69D5482125;
	Thu, 16 Apr 2020 21:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQzoSjhW3GRL; Thu, 16 Apr 2020 21:58:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F403B82146;
	Thu, 16 Apr 2020 21:58:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D76E7C0172;
	Thu, 16 Apr 2020 21:58:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E1F2C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 21:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B77E20348
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 21:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYnZnoujRukr
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 21:58:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5248B2011A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 21:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587074334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6rrlZafhN6r+ubaAk51QbjlJxlyC5zfccAUUw8zuIQ=;
 b=JZmNbH5fVqbCkEeKJUHruHY6dwPX/EMbr3by9LamfCCq5F8heRgu6C4Zmyjki9oG4N8bZF
 VBTLkZoDgz2B3ZuYPpo9piwVNKm+9hD1/rlbHvIsyMJRNMDk+X9Smzn3PF33efEKkMrLcI
 MlFzM6wUIAWulbmmzQCv3vbtvYi/jGA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-kwwV5ciNPWOTq-xBlQMk9w-1; Thu, 16 Apr 2020 17:58:47 -0400
X-MC-Unique: kwwV5ciNPWOTq-xBlQMk9w-1
Received: by mail-wm1-f69.google.com with SMTP id d134so1861903wmd.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 14:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M6rrlZafhN6r+ubaAk51QbjlJxlyC5zfccAUUw8zuIQ=;
 b=ImPfQt7OaT3jwe8/IQE835IA4p5qK2qa5PNWsmPCR+HuvRujrfG9LxKmM5lGaAP+Ei
 EC8hrhTI82K+c+SOdTMxaH5e5Gjkxyp9VIr9EYssUJnKEi9nx4013WNIwkNlt5F0XaoS
 LdpBn0YxdgnVy9uGyzrwkEvdNCQjkGxcfJ4mE/UmzlzoUiSgkJORHGqq6i6kbHt6uesm
 /wi1kubsd0qAu65nm/GKLwj1TeyZjifF2OsFzJyvXCu0c0/bUJv25haDZIjPMpMzjG9s
 orh5dxdeUYr8opx/LLiTg0sTt9YP/OA+faR8FoOnAbQA4Ut+RgZP9zT22y6ikGK1m7Ei
 3+gA==
X-Gm-Message-State: AGi0PubpO+kP/ayywyg/E4zb7TXybHNdbiKfaQ5e1x5xx4LqsmrIZf92
 Qcm0fDEp3ntPWKNFgVbh/BxTAgwQwZdyJFU4HNFRrd9979H2tFRGvoge5hTWY4YchGfMnR3/Igh
 qN5bMWmPr8dD3y7vNalY7aojlDmEDfsLpy61WA5l4KQ==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr6583325wmn.81.1587074325859; 
 Thu, 16 Apr 2020 14:58:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJuACRXU/ZXNyriL39YVRQFFxgHb4YC1TCpFzp0oXAv3mKwmNTGsmU40akcPlLbxfOx28D8Wg==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr6583297wmn.81.1587074325695; 
 Thu, 16 Apr 2020 14:58:45 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id f79sm5629022wme.32.2020.04.16.14.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 14:58:45 -0700 (PDT)
Date: Thu, 16 Apr 2020 17:58:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] vhost: cleanups and fixes
Message-ID: <20200416175644-mutt-send-email-mst@kernel.org>
References: <20200414123606-mutt-send-email-mst@kernel.org>
 <CAHk-=wgVQcD=JJVmowEorHHQSVmSw+vG+Ddc4FATZoTp9mfUmw@mail.gmail.com>
 <20200416081330-mutt-send-email-mst@kernel.org>
 <CAHk-=wjduPCAE-sr_XLUdExupiL0bOU5GBfpMd32cqMC-VVxeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjduPCAE-sr_XLUdExupiL0bOU5GBfpMd32cqMC-VVxeg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: hulkci@huawei.com, matej.genci@nutanix.com, KVM list <kvm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Netdev <netdev@vger.kernel.org>, yanaijie@huawei.com,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, ashutosh.dixit@intel.com,
 eperezma@redhat.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 eli@mellanox.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Markus Elfring <elfring@users.sourceforge.net>
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

On Thu, Apr 16, 2020 at 10:01:51AM -0700, Linus Torvalds wrote:
> On Thu, Apr 16, 2020 at 5:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > Well it's all just fallout from
> 
> What? No. Half of it seems to be the moving of "struct vring" around
> to other headers and stuff.
> 
> And then that is done very confusingly too, using two different
> structures both called "struct vring".
> 
> No way can I pull that kind of craziness as a "fix".
> 
>                 Linus

OK, I'll just disable vhost on that config for now - it was
suggested previously. Thanks for the comment and sorry about geeting it
wrong!


-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
