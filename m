Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 06064154ED2
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 23:17:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 504E486AD9;
	Thu,  6 Feb 2020 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04iklfmqzPIM; Thu,  6 Feb 2020 22:17:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7293186ACD;
	Thu,  6 Feb 2020 22:17:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58B45C013E;
	Thu,  6 Feb 2020 22:17:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86418C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7430E86AA1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tudJFH80iXdu
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:17:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E76686A72
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 22:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581027446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dliw2RAM/nP3vDLbquqsu5FLbVnJwrHBsnpHt8MF4Y8=;
 b=d0a967cJIX/f1cyfUf6PaLT4AZdRtgsifb2zRzWBKXE0utD6sXQlKIDhMT4yJ78uXA1osl
 GqDd98/FHpKIgGs7jvPIjiq0rHX5iItopQBhqnocdjtvV6umh9OtOC2uu+vAky6ruas5R0
 aUv98DNWpmqxYkZmS1+tPcevxfqjj+s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-ZDKOmfdiMISWRFqUjjOEXA-1; Thu, 06 Feb 2020 17:17:25 -0500
Received: by mail-qv1-f72.google.com with SMTP id z9so4635549qvo.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 14:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dliw2RAM/nP3vDLbquqsu5FLbVnJwrHBsnpHt8MF4Y8=;
 b=DUVzZmDEqGVCCSO+hc6VbxVD8Kgool/3N4d8it9PbjPmslGcCxdlL9s4+i/FCxZq33
 NWU+7RAkEtd8ttg2dVY0r+D6zN6vitLNxS86smJ8qyG9wCxxkYrDILO0CAS1css4WqrV
 jWlPXXcPzvCljBeMby1BYJvTim6idp+wD/FKo3QyPhOYAcI8hVI7O1LQLtQb7m9tWzJ7
 ABkRYjMQkD2s+clZJprw4j0AGGTUQWRwxl2NRmL3w5UORtiwIlDBeLvGc1dzp+I3AIPy
 nN+K149KvD1gNjO9RHV/lkEP1+PIyGMheRYcjaTWNXYtR+m0WTpJpz00Ycb//21lCWwf
 YpvQ==
X-Gm-Message-State: APjAAAUXQiZkAg4yDdsuzvWaJObHPJlzu0c4VjwiFxRN4db08Hg0eHvd
 jBUGouq1oCd5ocutcnYQoMROeepof7QGrrBHG49lEW7amiNkmVc+6kzeJrBwvr++3ht0bdZPDMq
 t/F58y+PnIsoq7HnvgLhtS33KV8ZmB7baIiQTMnw35A==
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr4304143qvb.198.1581027445012; 
 Thu, 06 Feb 2020 14:17:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4aT6nHPT/UCOxB/dIpvh77YFb+ccbCujxO7QlHqlvH0kWVJQHP+Kls/zNpxqC5KRYicsxvQ==
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr4304120qvb.198.1581027444763; 
 Thu, 06 Feb 2020 14:17:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id s22sm362089qke.19.2020.02.06.14.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 14:17:23 -0800 (PST)
Date: Thu, 6 Feb 2020 17:17:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200206171349-mutt-send-email-mst@kernel.org>
References: <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
X-MC-Unique: ZDKOmfdiMISWRFqUjjOEXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
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

On Thu, Feb 06, 2020 at 04:12:21PM +0100, Christian Borntraeger wrote:
> 
> 
> On 06.02.20 15:22, eperezma@redhat.com wrote:
> > Hi Christian.
> > 
> > Could you try this patch on top of ("38ced0208491 vhost: use batched version by default")?
> > 
> > It will not solve your first random crash but it should help with the lost of network connectivity.
> > 
> > Please let me know how does it goes.
> 
> 
> 38ced0208491 + this seem to be ok.
> 
> Not sure if you can make out anything of this (and the previous git bisect log)

Yes it does - that this is just bad split-up of patches, and there's
still a real bug that caused worse crashes :)

So I just pushed batch-v4.
I expect that will fail, and bisect to give us
    vhost: batching fetches
Can you try that please?


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
