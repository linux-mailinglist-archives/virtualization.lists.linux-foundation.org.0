Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D961EEB0D
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 21:23:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 74F30889D1;
	Thu,  4 Jun 2020 19:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYhZ5EFIwVEB; Thu,  4 Jun 2020 19:23:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D7348889B1;
	Thu,  4 Jun 2020 19:23:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC91DC016E;
	Thu,  4 Jun 2020 19:23:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1A80C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0188882B3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqvk8qIeWt4G
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0BCFE882AB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 19:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591298625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RK7OUZgW5NorsDX1d7OO/eYBX7LBH2rL3jyqXLO1xAg=;
 b=WRHBqhzvtnBiUmV2ty+J36YUH3f9qTLrGlc6oJm9pXiSRieRre7D52aD+lZLXX1NnYACOY
 nLQpSkV+uMqb4r33gM4NOUZFinK3KLXnb74w2nur+faVmlbufb1juGBUOwozxBY6YcH0/U
 A6dc8LFLknbFjM8gxGCUKhvCi5aR0KM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-JCR-JJyoNlqYcBWnuqhscg-1; Thu, 04 Jun 2020 15:23:42 -0400
X-MC-Unique: JCR-JJyoNlqYcBWnuqhscg-1
Received: by mail-wr1-f69.google.com with SMTP id p9so2812045wrx.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 04 Jun 2020 12:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RK7OUZgW5NorsDX1d7OO/eYBX7LBH2rL3jyqXLO1xAg=;
 b=nN3NA6oo7lno83vdzd3H+NDxiI+hjMcq92cBq91CkJAeviVv/wg139RivoBcT4SqPO
 kmub6GSxyg8tUkUZhggkyM/s8KU4gioOWoOWkR2gl2NM8a++XrWxpG9wXuZBYqPvdXLB
 jPgCNVJePChNNj/lMQ7c6F3fZWxVAs5U8Q7HdSHIbiMzZgODxxjcmxWLY0rXC+Ai6xj2
 ePQO+epMj1BwmUPKjiqBlb8P3WR6YhluCidvi/ba7RxHqon0+luv+VDHbXz+Ux6l9hzY
 QyN7WWUZs0jw0XsfMQBxnQoz+0fKZdWlKOA2MSK9mrgNdyMPpNnqKhWylE0nqGJkYMP9
 HPtw==
X-Gm-Message-State: AOAM531pLfH/tGwNm0xUKY4eMz5ieSZJcWWiYy6ybYzukURy7ozwg9d5
 bqOgSUL5ZyPEauuIQZ7cW0WvXa8siwM5OTokWuwXEQ6mkuEpnxvqbVhvqRgS6IU+vzn7641cp4f
 i9U/pJE0PtoKlpGxyCcS758UBYtksjniN9dYtLClCgw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr5815821wrs.100.1591298621573; 
 Thu, 04 Jun 2020 12:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp0/pnnPfhicvkES2RGb4PHh4oHYIiCtpAgZ3EQrs+Ij/+qtfXjmNZZ+e/z1giKYaInwdODw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr5815767wrs.100.1591298620862; 
 Thu, 04 Jun 2020 12:23:40 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 e10sm9109099wrn.11.2020.06.04.12.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 12:23:40 -0700 (PDT)
Date: Thu, 4 Jun 2020 15:23:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200604151917-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

On Wed, May 27, 2020 at 08:05:36PM +0200, Guennadi Liakhovetski wrote:
> v3:
> - address several checkpatch warnings
> - address comments from Mathieu Poirier
> 
> v2:
> - update patch #5 with a correct vhost_dev_init() prototype
> - drop patch #6 - it depends on a different patch, that is currently
>   an RFC
> - address comments from Pierre-Louis Bossart:
>   * remove "default n" from Kconfig
> 
> Linux supports RPMsg over VirtIO for "remote processor" /AMP use
> cases. It can however also be used for virtualisation scenarios,
> e.g. when using KVM to run Linux on both the host and the guests.
> This patch set adds a wrapper API to facilitate writing vhost
> drivers for such RPMsg-based solutions. The first use case is an
> audio DSP virtualisation project, currently under development, ready
> for review and submission, available at
> https://github.com/thesofproject/linux/pull/1501/commits
> A further patch for the ADSP vhost RPMsg driver will be sent
> separately for review only since it cannot be merged without audio
> patches being upstreamed first.


RPMsg over virtio has several problems. One is that it's
not specced at all. Before we add more stuff, I'd like so
see at least an attempt at describing what it's supposed to do.

Another it's out of line with 1.0 spec passing guest
endian data around. Won't work if host and guest
endian-ness do not match. Should pass eveything in LE and
convert.

It's great to see it's seeing active development finally.
Do you think you will have time to address these?



> Thanks
> Guennadi
> 
> Guennadi Liakhovetski (5):
>   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
>   vhost: (cosmetic) remove a superfluous variable initialisation
>   rpmsg: move common structures and defines to headers
>   rpmsg: update documentation
>   vhost: add an RPMsg API
> 
>  Documentation/rpmsg.txt          |   6 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +-------
>  drivers/vhost/Kconfig            |   7 +
>  drivers/vhost/Makefile           |   3 +
>  drivers/vhost/rpmsg.c            | 382 +++++++++++++++++++++++++++++++++++++++
>  drivers/vhost/vhost.c            |   2 +-
>  drivers/vhost/vhost_rpmsg.h      |  74 ++++++++
>  include/linux/virtio_rpmsg.h     |  81 +++++++++
>  include/uapi/linux/rpmsg.h       |   3 +
>  include/uapi/linux/vhost.h       |   4 +-
>  10 files changed, 559 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/vhost/rpmsg.c
>  create mode 100644 drivers/vhost/vhost_rpmsg.h
>  create mode 100644 include/linux/virtio_rpmsg.h
> 
> -- 
> 1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
