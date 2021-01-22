Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F36642FFD8C
	for <lists.virtualization@lfdr.de>; Fri, 22 Jan 2021 08:44:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BCD5A228EF;
	Fri, 22 Jan 2021 07:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n+brNeh4CML1; Fri, 22 Jan 2021 07:44:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 681EA228E7;
	Fri, 22 Jan 2021 07:44:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26E2EC013A;
	Fri, 22 Jan 2021 07:44:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5679C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 07:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8C45A86D79
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 07:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igP3Dfg9HIIE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 07:44:53 +0000 (UTC)
X-Greylist: delayed 17:07:52 by SQLgrey-1.7.6
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9AD7C86D70
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 07:44:53 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a1so4127352wrq.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 23:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xnObBx7qCVcq4Xmng0HzOiOYW//hrsobDgYRbXW2qoA=;
 b=dfhsrZgi1qJDI2m/ilO0UZ7ihv26w0btzlf1zmTicpi6ZJPqGMSAzlb7G4wGiF0FW3
 Gijmj6YCtu3PwTEsxPDNKVLwzNJfoZ+kzsARJbaXfKhjIPk0hIdEI6k7+iABd3J0Ge6o
 E21BaI1DVfxYzhQmtffSyiTWTX0ggTKcY1OLoksddvORRrvfQMQGbsphmp1xU/IKzC+G
 sD/zie7QvCQK1vih68EwWOxT3P4AOnndd/VBNtbw7iZsbzo+OPZQFBdc76x6uF8HLA4t
 egiWvXKCvt0EJ4zf4Nru3997s4IFCMrrcBcXNTQ8OpxxqBRXA3kIBOHmAEsIKhM9WxEA
 fFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xnObBx7qCVcq4Xmng0HzOiOYW//hrsobDgYRbXW2qoA=;
 b=gOmWmjZlLB0IIvf0Rhnngty3XuXbXA7WMZtW0oo3EXxyJLRyg1x1Qp7MrDOeM+ZVbM
 z03fE3COm4TH6jCOncrPXxGnOl1bQdDBKsIK6PXcnotoECF4fBbtEHy1dj9y+HSNE7CN
 xPeDgVIWo/o94Tx/YYQPxhuwEd8izcuVjYGHHuDrDCjW3OyxnSdqV2of5TigLqUsdJTI
 uhQJcKwoWRThIx35DggqUfIf5ljhF7qievzMvy9d0xwVRSM5BDW92K57XzoGxr8SljEl
 BJWzcefQSpVd+AKonzI7/y6NJ6okr5rDxYg/3Ucwh1CMsxFwokMNx0r9Uptxzoh71IWn
 G9Yg==
X-Gm-Message-State: AOAM532sA8PenEWCK71DuFCJoMRDossf3hYHxqDE/OEwRDG4k2KEaMUc
 +YRZSOYUFg3znyMo3J5lMm9RLqPZZQ2fV1Mp
X-Google-Smtp-Source: ABdhPJwPLaEjEPKwC34UrAC2gsulKg3s4j7+J97bZTNNIKaoZ/lJu48wNw2Iwm4BkDrJnbbca6y71A==
X-Received: by 2002:a63:1f18:: with SMTP id f24mr3506723pgf.133.1611301030526; 
 Thu, 21 Jan 2021 23:37:10 -0800 (PST)
Received: from [10.8.0.116] ([196.245.9.36])
 by smtp.gmail.com with ESMTPSA id fh7sm7835085pjb.43.2021.01.21.23.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 23:37:09 -0800 (PST)
Subject: Re: [PATCH 1/2] block: remove unnecessary argument from
 blk_execute_rq_nowait
To: Christoph Hellwig <hch@infradead.org>
References: <20210121142905.13089-1-guoqing.jiang@cloud.ionos.com>
 <20210121142905.13089-2-guoqing.jiang@cloud.ionos.com>
 <20210121170257.GA4120717@infradead.org>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <b87591b9-e598-6436-d41f-80cc56640549@cloud.ionos.com>
Date: Fri, 22 Jan 2021 08:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121170257.GA4120717@infradead.org>
Content-Language: en-US
Cc: axboe@kernel.dk, linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, target-devel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



On 1/21/21 18:02, Christoph Hellwig wrote:
> On Thu, Jan 21, 2021 at 03:29:04PM +0100, Guoqing Jiang wrote:
>> The 'q' is not used since commit a1ce35fa4985 ("block: remove dead
>> elevator code"), also update the comment of the function.
> 
> And more importantly it never really was needed to start with given
> that we can triviall derive it from struct request.

Thanks Christoph, will add the above to header and send new version.

Guoqing
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
