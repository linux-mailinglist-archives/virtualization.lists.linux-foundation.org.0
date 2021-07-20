Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C33D014D
	for <lists.virtualization@lfdr.de>; Tue, 20 Jul 2021 20:11:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89DFA60889;
	Tue, 20 Jul 2021 18:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpWavJh5NK4o; Tue, 20 Jul 2021 18:11:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 615DB606C6;
	Tue, 20 Jul 2021 18:11:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3118C000E;
	Tue, 20 Jul 2021 18:11:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36080C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 18:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15877403C1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 18:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZ-vj7fM2NUc
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 18:11:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A21B403B7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 18:11:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A280F610F7;
 Tue, 20 Jul 2021 18:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626804699;
 bh=rIvcPnlk8F/v3noffv3nLg5nIBn+iiWimm3NpnDG1fU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BsOmLpLNkcg+5IcUXmRopcIJAHJ0Na5eiECJ2oyRTOp02vXF+TtI2sRDdp0HaPjVZ
 6rXKYtkIgsSLenrRqiAzJGIxUrgUjxnr6I6dtAhfmuu4d1vAADufNxYBkf3MSvT7wo
 I14Ao87YvNyrjDlWba/lnHEaPyImDNA1zWwdnvBI=
Date: Tue, 20 Jul 2021 20:11:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vishnu Dasa <vdasa@vmware.com>
Subject: Re: [PATCH] MAINTAINERS: Update for VMCI driver
Message-ID: <YPcR2BHqTEamU3dU@kroah.com>
References: <1626776941-9163-1-git-send-email-jhansen@vmware.com>
 <YPan14jucU9/u6JL@kroah.com>
 <0DE37084-185C-4144-AF9E-22EC044B0CB5@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0DE37084-185C-4144-AF9E-22EC044B0CB5@vmware.com>
Cc: Pv-drivers <Pv-drivers@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jorgen Hansen <jhansen@vmware.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

On Tue, Jul 20, 2021 at 06:04:15PM +0000, Vishnu Dasa wrote:
> 
> On Jul 20, 2021, at 3:39 AM, Greg KH <gregkh@linuxfoundation.org<mailto:gregkh@linuxfoundation.org>> wrote:
> 
> Also I would need an ack from Vishnu.
> 
> Acked-by: Vishnu Dasa <vdasa@vmware.com<mailto:dasa@vmware.com>>

A maintainer that sends html email isn't going to work very well :(

Please fix.

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
