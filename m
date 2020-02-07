Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3115535E
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 08:58:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BC1787D5E;
	Fri,  7 Feb 2020 07:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKC29wRJjyET; Fri,  7 Feb 2020 07:58:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6128D87D6C;
	Fri,  7 Feb 2020 07:58:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FBD2C013E;
	Fri,  7 Feb 2020 07:58:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8849DC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C3B687D57
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktxEolKBn7mp
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:58:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C25FB87D36
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581062320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HenEqyaWD9A3GA5daQn5LKIiUsd/BikWwsStjqnEW1M=;
 b=Z4HSOvs6k7Lqqs3eFoI5RaYZ7lzopGgOsysKNn2w2LPBwCLqtFb3NxaZRIfOdkUKkWIjLd
 DNa7T0PLRKzJwfrxkqphRhLyMeT2afBc/hq0lTJAjeO+SnfueuZkQIpbzUc0udhkq4MsJ3
 12HIoxU710H6zXaB0X9aWuKrvZXEkNI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-vMeB6mtaPmW2lBdfHGM6sQ-1; Fri, 07 Feb 2020 02:58:38 -0500
Received: by mail-qk1-f200.google.com with SMTP id t186so866157qkf.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 23:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HenEqyaWD9A3GA5daQn5LKIiUsd/BikWwsStjqnEW1M=;
 b=agjEBx8Lga9jjl9Xs5lMrscjnQSyszoean0qfG6xqj64HfIKXOS0Lnx8OsRGMO5DdS
 Dhi4f7sa8fCQV9s5IRo0F1DH21lZOFsDrQ5rphJWuHiSFkx1wbvrOH6FG8QG1FO9pY23
 1dlL3yNGNwc7CwSFJZ8tYbz92JG20gFldbRaZ1Xn7fMc/QH5FojRlWvUNY4hacn9i0cd
 kPzwN9kvxgLY80OIq9VRxgxTP4NE2QGwGvjOvo7HyqoEFHnNTtusoA8uH+kIGOeOO1f+
 sAuzkcb2Fy8LTHsHfdMcFcEf1Pxadg6ubsHmu770bcfxEKtEso1gTlNgQtsuUW8QJisK
 zoQQ==
X-Gm-Message-State: APjAAAXIaO+PP/htXWEhe4P3E2dsbmjl/jVB7NGQBpoXBsOFKB24sr7c
 S4h4KoiVW5oOHjLJl+UGmjR/vIPriHCUKPhcv3Y7R07f7ebVF7p8FSrKoEQ0PKbRTxKrtFXmkdO
 fiNlRGDzacN+dNlE2l/6I99EU5h8xJkAHnA1yLBn8Lw==
X-Received: by 2002:aed:34c1:: with SMTP id x59mr6453464qtd.236.1581062318423; 
 Thu, 06 Feb 2020 23:58:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqziMqz1E8IKbTESJfX9C1no83ZH/Toj/qyo6qUx6yX4UiOkZkQZ1T+NzcXp4I3jI9TAHXN8Bw==
X-Received: by 2002:aed:34c1:: with SMTP id x59mr6453447qtd.236.1581062318154; 
 Thu, 06 Feb 2020 23:58:38 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id g77sm906726qke.129.2020.02.06.23.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 23:58:37 -0800 (PST)
Date: Fri, 7 Feb 2020 02:58:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200207025806-mutt-send-email-mst@kernel.org>
References: <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
X-MC-Unique: vMeB6mtaPmW2lBdfHGM6sQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 eperezma@redhat.com, Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Fri, Feb 07, 2020 at 08:47:14AM +0100, Christian Borntraeger wrote:
> Also adding Cornelia.
> 
> 
> On 06.02.20 23:17, Michael S. Tsirkin wrote:
> > On Thu, Feb 06, 2020 at 04:12:21PM +0100, Christian Borntraeger wrote:
> >>
> >>
> >> On 06.02.20 15:22, eperezma@redhat.com wrote:
> >>> Hi Christian.
> >>>
> >>> Could you try this patch on top of ("38ced0208491 vhost: use batched version by default")?
> >>>
> >>> It will not solve your first random crash but it should help with the lost of network connectivity.
> >>>
> >>> Please let me know how does it goes.
> >>
> >>
> >> 38ced0208491 + this seem to be ok.
> >>
> >> Not sure if you can make out anything of this (and the previous git bisect log)
> > 
> > Yes it does - that this is just bad split-up of patches, and there's
> > still a real bug that caused worse crashes :)
> > 
> > So I just pushed batch-v4.
> > I expect that will fail, and bisect to give us
> >     vhost: batching fetches
> > Can you try that please?
> > 
> 
> yes.
> 
> eccb852f1fe6bede630e2e4f1a121a81e34354ab is the first bad commit
> commit eccb852f1fe6bede630e2e4f1a121a81e34354ab
> Author: Michael S. Tsirkin <mst@redhat.com>
> Date:   Mon Oct 7 06:11:18 2019 -0400
> 
>     vhost: batching fetches
>     
>     With this patch applied, new and old code perform identically.
>     
>     Lots of extra optimizations are now possible, e.g.
>     we can fetch multiple heads with copy_from/to_user now.
>     We can get rid of maintaining the log array.  Etc etc.
>     
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
>  drivers/vhost/test.c  |  2 +-
>  drivers/vhost/vhost.c | 39 ++++++++++++++++++++++++++++++++++-----
>  drivers/vhost/vhost.h |  4 +++-
>  3 files changed, 38 insertions(+), 7 deletions(-)
> 


And the symptom is still the same - random crashes
after a bit of traffic, right?

> > 
> 			

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
