Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB02155407
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 09:54:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EC12320358;
	Fri,  7 Feb 2020 08:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68ySw4c3+Q3b; Fri,  7 Feb 2020 08:54:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1E54020353;
	Fri,  7 Feb 2020 08:54:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDE9EC013E;
	Fri,  7 Feb 2020 08:54:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1E9DC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C78D9816D8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdKoOJEn2S3k
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:54:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1768D813FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581065649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0USnf3hBn92ifbh7P2D9fosqj0oQrhEhCYDRgIDXfoE=;
 b=KtUCSeXnu4vcZuxCbtH2LyuDPy3dbhTYCSdMa7p55sF3EDZjMOs2G7GmRA5PrFqVn6eOUr
 T2spddgHEny2fdSombbK6YZz2TX/nlXApBcYvWiC0wNfRXYuAc3vMx9QFpdOuMFdHVj3ZW
 ouxSQhcVJHzc7XmHZpCK1Dl3Bpp2YEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-wGf86mQwOcWZfWagUhSSDA-1; Fri, 07 Feb 2020 03:54:08 -0500
X-MC-Unique: wGf86mQwOcWZfWagUhSSDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF06810CE783;
 Fri,  7 Feb 2020 08:54:06 +0000 (UTC)
Received: from gondolin (ovpn-117-112.ams2.redhat.com [10.36.117.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82683857BF;
 Fri,  7 Feb 2020 08:53:56 +0000 (UTC)
Date: Fri, 7 Feb 2020 09:53:53 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger
 random crashes in KVM guests after reboot
Message-ID: <20200207095353.08bc91e4.cohuck@redhat.com>
In-Reply-To: <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
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
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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

On Fri, 7 Feb 2020 09:13:14 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 07.02.20 08:58, Michael S. Tsirkin wrote:
> > On Fri, Feb 07, 2020 at 08:47:14AM +0100, Christian Borntraeger wrote:  
> >> Also adding Cornelia.
> >>
> >>
> >> On 06.02.20 23:17, Michael S. Tsirkin wrote:  
> >>> On Thu, Feb 06, 2020 at 04:12:21PM +0100, Christian Borntraeger wrote:  
> >>>>
> >>>>
> >>>> On 06.02.20 15:22, eperezma@redhat.com wrote:  
> >>>>> Hi Christian.
> >>>>>
> >>>>> Could you try this patch on top of ("38ced0208491 vhost: use batched version by default")?
> >>>>>
> >>>>> It will not solve your first random crash but it should help with the lost of network connectivity.
> >>>>>
> >>>>> Please let me know how does it goes.  
> >>>>
> >>>>
> >>>> 38ced0208491 + this seem to be ok.
> >>>>
> >>>> Not sure if you can make out anything of this (and the previous git bisect log)  
> >>>
> >>> Yes it does - that this is just bad split-up of patches, and there's
> >>> still a real bug that caused worse crashes :)
> >>>
> >>> So I just pushed batch-v4.
> >>> I expect that will fail, and bisect to give us
> >>>     vhost: batching fetches
> >>> Can you try that please?
> >>>  
> >>
> >> yes.
> >>
> >> eccb852f1fe6bede630e2e4f1a121a81e34354ab is the first bad commit
> >> commit eccb852f1fe6bede630e2e4f1a121a81e34354ab
> >> Author: Michael S. Tsirkin <mst@redhat.com>
> >> Date:   Mon Oct 7 06:11:18 2019 -0400
> >>
> >>     vhost: batching fetches
> >>     
> >>     With this patch applied, new and old code perform identically.
> >>     
> >>     Lots of extra optimizations are now possible, e.g.
> >>     we can fetch multiple heads with copy_from/to_user now.
> >>     We can get rid of maintaining the log array.  Etc etc.
> >>     
> >>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >>  drivers/vhost/test.c  |  2 +-
> >>  drivers/vhost/vhost.c | 39 ++++++++++++++++++++++++++++++++++-----
> >>  drivers/vhost/vhost.h |  4 +++-
> >>  3 files changed, 38 insertions(+), 7 deletions(-)
> >>  
> > 
> > 
> > And the symptom is still the same - random crashes
> > after a bit of traffic, right?  
> 
> random guest crashes after a reboot of the guests. As if vhost would still
> write into now stale buffers.
> 

I'm late to the party; but where is that commit located? Or has it been
dropped again already?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
