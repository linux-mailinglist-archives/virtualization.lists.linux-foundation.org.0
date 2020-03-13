Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C7184331
	for <lists.virtualization@lfdr.de>; Fri, 13 Mar 2020 10:03:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3ED5986113;
	Fri, 13 Mar 2020 09:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnZSh0j2mgQM; Fri, 13 Mar 2020 09:03:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7701D860C4;
	Fri, 13 Mar 2020 09:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BF84C0177;
	Fri, 13 Mar 2020 09:03:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 786FBC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 09:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6717187C24
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 09:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jssz3m8oIqMb
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 09:03:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60D8487C22
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 09:03:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A633C804D0;
 Fri, 13 Mar 2020 10:03:39 +0100 (CET)
Date: Fri, 13 Mar 2020 10:03:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] drm/bochs: downgrade pci_request_region failure from
 error to warning
Message-ID: <20200313090338.GA31815@ravnborg.org>
References: <20200313084152.2734-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313084152.2734-1-kraxel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=vkfgAjWNAAAA:8
 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8 a=XvIV5Jx4ir0DwZFBozwA:9
 a=wPNLvfGTeEIA:10 a=s88AYcEWOXMFsoP9cgP2:22 a=E9Po1WZjFZOl8hwRPBS3:22
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, marmarek@invisiblethingslab.com,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Gred.

On Fri, Mar 13, 2020 at 09:41:52AM +0100, Gerd Hoffmann wrote:
> Shutdown of firmware framebuffer has a bunch of problems.  Because
> of this the framebuffer region might still be reserved even after
> drm_fb_helper_remove_conflicting_pci_framebuffers() returned.
> =

> Don't consider pci_request_region() failure for the framebuffer
> region as fatal error to workaround this issue.
> =

> Reported-by: Marek Marczykowski-G=F3recki <marmarek@invisiblethingslab.co=
m>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs_hw.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/boc=
hs_hw.c
> index 952199cc0462..dce4672e3fc8 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -157,10 +157,8 @@ int bochs_hw_init(struct drm_device *dev)

There is a drm_device avilable.

>  		size =3D min(size, mem);
>  	}
>  =

> -	if (pci_request_region(pdev, 0, "bochs-drm") !=3D 0) {
> -		DRM_ERROR("Cannot request framebuffer\n");
> -		return -EBUSY;
> -	}
> +	if (pci_request_region(pdev, 0, "bochs-drm") !=3D 0)
> +		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
So you could use drm_WARN() which is what is preferred these days.
With this fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
