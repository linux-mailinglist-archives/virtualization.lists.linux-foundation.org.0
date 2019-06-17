Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EE548AEE
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 19:58:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2BE04DB1;
	Mon, 17 Jun 2019 17:58:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E7297CAC
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 17:58:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FC0582F
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 17:58:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w9so508058wmd.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
	b=iir/cwro3Uo0pydX2p6MssHcUcKCWLi3F0aRNfT9oiuPoCu3KzQi3D++TfCMCA5kbq
	UhdVsSno+MyWwqU7UMla2YRrjl3vooBFlx0nKtYTh44mvlxTjTeU/ZMsoTFT3Na0Nbo8
	zbXVWPc9pfLCEz8akgJpe2z9seqCP2z2haWgAfsi9/bgn50zH7bOZc5jW9vXW8SMk4Rt
	tx2lTCVIciiKlEe6uGemUYOgLdxEayja9E1N+noF29tOg7VjKlKwytO7pxFuV7oS4QEN
	rJlpCllgKrwVj7eJfedrwSjRfOJSjzakYsBlPrwpP8+Cypssx+Hl6JwcIa7W9QWRzmBt
	BA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
	b=YD68zvpMcUwb3KPgboWvrqnJ2Cv1t5WANLR3uFbd/8Sr8lMRdhZVzfMVSjlieP1uTP
	RzL+8dPpTN8FAl0oNWQIy6lrJXJtS3X0t3fWj+Z/5PHFshIbCuTM9K5tlVnNbCnP9y8z
	7ZkoQjC5ML4k/8/eh9R78ugUIxg2NN79VeJ/7CeSBGDLCydbjP05lN3/JP82zrnZ1YeD
	3UDw+Efd0gflT0cbweS58rP/TXVUGLVez+Z1uzgfPI9ChGBQTME6zYRHqKoLz7K9pqkf
	mfqBY+pHJVHd5cRYlm7AOzCvoa5I2ji2eNgUzhmI2oJDxBkt1p/PTTzeVQNxhfCjlYjo
	YInw==
X-Gm-Message-State: APjAAAUHMf3RRqH1TpJWT/sdgiYpC5gc0wfdOUpwEXrIWc1s3OX/kwuu
	K1rWZRPGW6einICAAC8YNI8=
X-Google-Smtp-Source: APXvYqxzwMRI3pC9nLxx+cmi8fX06IrtlUhdDEcmz2BcTfXpaVk8v0SGvmPS+vZF06+nGUJcsaBAYg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr21050453wmd.116.1560794289646; 
	Mon, 17 Jun 2019 10:58:09 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
	by smtp.gmail.com with ESMTPSA id
	s188sm13333537wmf.40.2019.06.17.10.58.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 10:58:08 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:56:06 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 06/59] drm/prime: Actually remove DRIVER_PRIME everywhere
Message-ID: <20190617175606.GE26766@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
	<20190614203615.12639-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	DRI Development <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	VMware Graphics <linux-graphics-maintainer@vmware.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	spice-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	etnaviv@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	freedreno@lists.freedesktop.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 2019/06/14, Daniel Vetter wrote:
> Split out to make the functional changes stick out more.
> 
Since this patch flew-by, as standalone one (intentionally or not) I'd
add, anything vaguely like:

"Core users of DRIVER_PRIME were removed from core with prior patches."

HTH
Emil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
