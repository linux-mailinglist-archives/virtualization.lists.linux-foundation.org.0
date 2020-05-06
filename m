Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE81C6D20
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 11:40:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2C7C86ACE;
	Wed,  6 May 2020 09:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRiCeCEfLki5; Wed,  6 May 2020 09:40:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D2565861DE;
	Wed,  6 May 2020 09:40:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A525FC0859;
	Wed,  6 May 2020 09:40:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEF2AC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 95977876B4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCTJSlXalCNU
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:40:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6F371876FD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588758002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJ4kEjO/bwheMovYORrIfy7ArmLVCRzD0yejl3ZmrDY=;
 b=XD+HdxkjPRi5aoYZtsT0NGoAKDp15lWqrzc1KcyAe0zUaZPpD0Dcw1/04+fxVgQhUfNlbf
 Y3qEiynKov6o+UJ6mJnsrwYhEuXND3pgDj4SWNzrbhzBEFqZhgGCY/u5klXTxwS8NlUOgT
 DyiJtSuuhFFgs33u9a80mChV5qtUa3E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-OkFqbzg7OGSxtz779zc4tw-1; Wed, 06 May 2020 05:40:00 -0400
X-MC-Unique: OkFqbzg7OGSxtz779zc4tw-1
Received: by mail-wr1-f70.google.com with SMTP id y4so1032614wrt.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 02:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kJ4kEjO/bwheMovYORrIfy7ArmLVCRzD0yejl3ZmrDY=;
 b=c5S+1b08iNDV7kVRkPxrHf/JxjCIL8FUExEyOA8WfAr/F4H/DWcLGXDsQqq+cMnhUI
 vr72xm3yTaO7D9IVadYu+inFNO7XBit88z+TNR3FIIDNTzVU+uqQ5xK/VWROco+1Q1mv
 UTTr6S+SS8AJ0eRMHTX3FyDzEAxFFxY8C82Ik3joHAc6NNYwRJXImY5z/PitbOX0Dga5
 BxgBcvk+seIukOEIrqh/dBjM3J3JK9DILB6w4w84emBbKzSCQvPTK6mw1ch2U1RjgwTH
 iFlo+xOvWhZ3zp2aj5JWqjeQiuk7EIkfilgpGVXTIv6tYS8M1sEsqbg+4Rr3ZQtPRr2S
 Atzg==
X-Gm-Message-State: AGi0PuZwKq55+oZea73jz4ZBDntyolHusDq1eKm+LiSGbwDXsZqLaD6z
 DheilNEItN3KbiyFye9RKNF+cbX6tiffOjdUH2oVyxHPInZ4xjicXYyx10fWpYaVRq/cNT1G4fE
 KkKW3heanwTguvt6FXgcwBsapdeuaP49vq19i5QpxkA==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr8949396wrt.139.1588757999143; 
 Wed, 06 May 2020 02:39:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypK13X0Zo4jMSTyL7ujAS9WuUrdxRvvZsqJbiGw8vpveKPhCdyH4OKPB+Frf82bNzjKr1/MqGg==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr8949372wrt.139.1588757998970; 
 Wed, 06 May 2020 02:39:58 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 m4sm1993050wrb.42.2020.05.06.02.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 02:39:58 -0700 (PDT)
Date: Wed, 6 May 2020 05:39:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [GIT PULL] vhost: fixes
Message-ID: <20200506053948-mutt-send-email-mst@kernel.org>
References: <20200504081540-mutt-send-email-mst@kernel.org>
 <AM6PR08MB40696EFF8BE389C134AC04F6F7A40@AM6PR08MB4069.eurprd08.prod.outlook.com>
 <20200506031918-mutt-send-email-mst@kernel.org>
 <20200506092546.o6prnn4d66tavmjl@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200506092546.o6prnn4d66tavmjl@steredhat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "n.b@live.com" <n.b@live.com>, Justin He <Justin.He@arm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ldigby@redhat.com" <ldigby@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Wed, May 06, 2020 at 11:25:46AM +0200, Stefano Garzarella wrote:
> On Wed, May 06, 2020 at 03:19:55AM -0400, Michael S. Tsirkin wrote:
> > On Wed, May 06, 2020 at 03:28:47AM +0000, Justin He wrote:
> > > Hi Michael
> > > 
> > > > -----Original Message-----
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Monday, May 4, 2020 8:16 PM
> > > > To: Linus Torvalds <torvalds@linux-foundation.org>
> > > > Cc: kvm@vger.kernel.org; virtualization@lists.linux-foundation.org;
> > > > netdev@vger.kernel.org; linux-kernel@vger.kernel.org; Justin He
> > > > <Justin.He@arm.com>; ldigby@redhat.com; mst@redhat.com; n.b@live.com;
> > > > stefanha@redhat.com
> > > > Subject: [GIT PULL] vhost: fixes
> > > >
> > > > The following changes since commit
> > > > 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c:
> > > >
> > > >   Linux 5.7-rc3 (2020-04-26 13:51:02 -0700)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
> > > >
> > > > for you to fetch changes up to
> > > > 0b841030625cde5f784dd62aec72d6a766faae70:
> > > >
> > > >   vhost: vsock: kick send_pkt worker once device is started (2020-05-02
> > > > 10:28:21 -0400)
> > > >
> > > > ----------------------------------------------------------------
> > > > virtio: fixes
> > > >
> > > > A couple of bug fixes.
> > > >
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > > ----------------------------------------------------------------
> > > > Jia He (1):
> > > >       vhost: vsock: kick send_pkt worker once device is started
> > > 
> > > Should this fix also be CC-ed to stable? Sorry I forgot to cc it to stable.
> > > 
> > > --
> > > Cheers,
> > > Justin (Jia He)
> > 
> > 
> > Go ahead, though recently just including Fixes seems to be enough.
> > 
> 
> The following patch Justin refers to does not contain the "Fixes:" tag:
> 
> 0b841030625c vhost: vsock: kick send_pkt worker once device is started
> 
> 
> I think we should merge it on stable branches, so if needed, I can backport
> and send it.
> 
> Stefano

Go ahead.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
