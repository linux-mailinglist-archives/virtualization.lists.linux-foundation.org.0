Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B38241BF1C8
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 09:51:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6556086CD0;
	Thu, 30 Apr 2020 07:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlJGBgkqLMeN; Thu, 30 Apr 2020 07:51:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF72A86CC5;
	Thu, 30 Apr 2020 07:51:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBE9FC016F;
	Thu, 30 Apr 2020 07:51:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1223CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EF4D886CB5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nF7N2yg7WAuB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:51:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6CA6786CAC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588233106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jbGr2ig4vgb1TP5cq80iQERW70+bZ4c7IzAQ3JZcv5s=;
 b=FvUMCnSSqL79PrtkZm/tjJMI0Fcjw/iEmGeRbyCmiFxN3Ewy9T2sXbkSslfkS4hOBMijg9
 716CXR2rnrBzvWKd1AaGHe3r90wg3+Dbvz7v2EM0E78iXhCU3Xol6D5hDAVeCM5s+fXeTD
 de7ojge7TfpHIy33dMfcd3aTDxgd4QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-xiwibxjtMqmv_HGxOeMIdw-1; Thu, 30 Apr 2020 03:51:44 -0400
X-MC-Unique: xiwibxjtMqmv_HGxOeMIdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24DF31005510;
 Thu, 30 Apr 2020 07:51:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEF3310013BD;
 Thu, 30 Apr 2020 07:51:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E9D449D98; Thu, 30 Apr 2020 09:51:41 +0200 (CEST)
Date: Thu, 30 Apr 2020 09:51:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: lepton <ytht.net@gmail.com>
Subject: Re: [PATCH 0/1] Add uvirtio for testing
Message-ID: <20200430075141.kjldxjhylwo347bf@sirius.home.kraxel.org>
References: <20200428204729.64569-1-ytht.net@gmail.com>
 <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
 <20200429115836.u5vqt3s6l4wcejjd@sirius.home.kraxel.org>
 <CALqoU4wHbkqVx2WiF4ieZ1Bg6DE5OWzzUGrQbe8EYsO8ruq3Xg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALqoU4wHbkqVx2WiF4ieZ1Bg6DE5OWzzUGrQbe8EYsO8ruq3Xg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org
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

On Wed, Apr 29, 2020 at 08:59:18PM -0700, lepton wrote:
> On Wed, Apr 29, 2020 at 4:58 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > > 3) Need to be verbose on how the vring processing work in the commit log of
> > > patch 1
> >
> > Ecven better a file documenting the interface somewhere in
> > Documentation/
> I put a uvirtio-vga.c under samples/uvirtio and hope this can serve
> the purpose of the document since currently that's the only tested use
> case.

Sample code is good, but *commented* sample code would be better.

> Maybe have a document later if this really get more use cases?

Well, having good documentation right from the start would help getting
more use cases ;)

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
