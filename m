Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B173726A57C
	for <lists.virtualization@lfdr.de>; Tue, 15 Sep 2020 14:46:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1999A86398;
	Tue, 15 Sep 2020 12:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVzqQjx6Wu9q; Tue, 15 Sep 2020 12:46:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 718788638E;
	Tue, 15 Sep 2020 12:46:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54F5EC0051;
	Tue, 15 Sep 2020 12:46:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CFB5C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 12:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7B92B866BD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 12:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eL7lwfq-S5nD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 12:46:23 +0000 (UTC)
X-Greylist: delayed 00:32:29 by SQLgrey-1.7.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B1CF866B9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 12:46:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FC2LFb006517; Tue, 15 Sep 2020 14:13:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=kKdS2tlwzV059/Lhs1Caty/4XEr8KG1zy796n1j1L0M=;
 b=XnqI1FkUTTwhp/zh3usFXCinlAiIWxdSjX9yCybtvtwfqeyyLMVZRPFD8ymhKDUIgjSV
 rD32tvqiHqirqlR7qO41Y0BFcm9soNh6IAPqQSmp9YOrDQ+bHijSenPyqRWmE5TOedyl
 w88sj11s2gU7jV+JIOpNzMcDKtCvsoDtMjsenD5T/JrrooLdcRC+Qibj3WLFd7bf+6eU
 6UOOVoYqMBuvaZaUMTLQojJ1rn7J8Kx+pNckymfekfHu/xW57aWI9zB0VcswhcGzMZwa
 NTp8s2wYW+9fgYJJmLM2bfN0yes3aGkydiZ1gK/LBNH405ibdc4QavstMAdYTUKt+BJK kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33gn7gyh1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 14:13:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFA8C100039;
 Tue, 15 Sep 2020 14:13:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF8D42B0EA9;
 Tue, 15 Sep 2020 14:13:25 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep
 2020 14:13:24 +0200
Subject: Re: [PATCH v6 0/4] Add a vhost RPMsg API
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
References: <20200901151153.28111-1-guennadi.liakhovetski@linux.intel.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <9433695b-5757-db73-bd8a-538fd1375e2a@st.com>
Date: Tue, 15 Sep 2020 14:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901151153.28111-1-guennadi.liakhovetski@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_08:2020-09-15,
 2020-09-15 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
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

Hi  Guennadi,

On 9/1/20 5:11 PM, Guennadi Liakhovetski wrote:
> Hi,
> 
> Next update:
> 
> v6:
> - rename include/linux/virtio_rpmsg.h -> include/linux/rpmsg/virtio.h
> 
> v5:
> - don't hard-code message layout
> 
> v4:
> - add endianness conversions to comply with the VirtIO standard
> 
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
> Linux supports RPMsg over VirtIO for "remote processor" / AMP use
> cases. It can however also be used for virtualisation scenarios,
> e.g. when using KVM to run Linux on both the host and the guests.
> This patch set adds a wrapper API to facilitate writing vhost
> drivers for such RPMsg-based solutions. The first use case is an
> audio DSP virtualisation project, currently under development, ready
> for review and submission, available at
> https://github.com/thesofproject/linux/pull/1501/commits

Mathieu pointed me your series. On my side i proposed the rpmsg_ns_msg
service[1] that does not match with your implementation.
As i come late, i hope that i did not miss something in the history...
Don't hesitate to point me the discussions, if it is the case.

Regarding your patchset, it is quite confusing for me. It seems that you
implement your own protocol on top of vhost forked from the RPMsg one.
But look to me that it is not the RPMsg protocol.

So i would be agree with Vincent[2] which proposed to switch on a RPMsg API
and creating a vhost rpmsg device. This is also proposed in the 
"Enhance VHOST to enable SoC-to-SoC communication" RFC[3].
Do you think that this alternative could match with your need?

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335 
[2]. https://www.spinics.net/lists/linux-virtualization/msg44195.html
[3]. https://www.spinics.net/lists/linux-remoteproc/msg06634.html  

Thanks,
Arnaud

> 
> Thanks
> Guennadi
> 
> Guennadi Liakhovetski (4):
>   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
>   rpmsg: move common structures and defines to headers
>   rpmsg: update documentation
>   vhost: add an RPMsg API
> 
>  Documentation/rpmsg.txt          |   6 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +------
>  drivers/vhost/Kconfig            |   7 +
>  drivers/vhost/Makefile           |   3 +
>  drivers/vhost/rpmsg.c            | 373 +++++++++++++++++++++++++++++++
>  drivers/vhost/vhost_rpmsg.h      |  74 ++++++
>  include/linux/rpmsg/virtio.h     |  83 +++++++
>  include/uapi/linux/rpmsg.h       |   3 +
>  include/uapi/linux/vhost.h       |   4 +-
>  9 files changed, 551 insertions(+), 80 deletions(-)
>  create mode 100644 drivers/vhost/rpmsg.c
>  create mode 100644 drivers/vhost/vhost_rpmsg.h
>  create mode 100644 include/linux/rpmsg/virtio.h
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
