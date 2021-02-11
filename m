Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 59783318FB8
	for <lists.virtualization@lfdr.de>; Thu, 11 Feb 2021 17:20:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13F6286DD3;
	Thu, 11 Feb 2021 16:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3o6mtcTDTo8; Thu, 11 Feb 2021 16:20:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6107387446;
	Thu, 11 Feb 2021 16:20:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28D56C013A;
	Thu, 11 Feb 2021 16:20:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B8FDC013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 16:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4AA358634C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 16:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUc4Tr8DGIcq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 16:20:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C6E2684516
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 16:20:15 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id u66so6662429oig.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 08:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MAyrtQhdnPi+THVCt2Y8nxvlrp3tKuk+brgAb9FMscw=;
 b=FsmxhQxF0emlFfSXthi+V3JWArCjwumQlBUqeLMSuMQGPb6hyDklW+q7Heb1Aj05wf
 pWGJERgO7LzfpysHMCZmQ6A2GHf4N1Ov79EYpvDYsoFpwMXqbk7Ar8adEqdkAb6lxaF8
 9tR604y5mbJNBYc3U0+YT51EjOaeACCnuVkaZpeRZwAoXgh1cYNaNaIx1YUsDnuGnIEK
 B1X4hIdKIXl0xvH8uTQWHzaMyTcnnmrJPw3i8yuVxcL9Do36Ow3ZmGBEwE/DmEvD1eKS
 2GyKN9dc6MjSxm5uBaYEHEryNn2YEGrhY9n5TfYB+p+UEK1dz87XrL5UbjDqOhPh/SZw
 /M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MAyrtQhdnPi+THVCt2Y8nxvlrp3tKuk+brgAb9FMscw=;
 b=k96ALL1YEfV284yVFW2lHbxndttdyBwkcr4MDSCgwBiz7ga+uO+lTS71XDaFTHZUpm
 JpuJZXtjbhfU1NZ43lbqNGMRBqQdPJ7J5+uGhD51Lj09JhyuDNxnPwROMG4jK7sW7b5H
 0xJDzLr98CKsAHv/QshJa5ydQVIYGMzm75CcWTXMPfWFOp+6Iq6LrFARZIw6wLwnc348
 yGkEZKUqgNr2Bn/mlNsGQx7NEje8vLAMEZAOVMiFvVuQjZlXrOiQMQHyzZpWsNx8t5Av
 L2dpIuPPft6LVLIRKu5UD2Z1g437IfU3T7SDqY42yFr8PzUYFKXnnDUkDUQPKYqRD/Mo
 W7oQ==
X-Gm-Message-State: AOAM533jWlmN+XFdQLM+Zc6xS/HSWETxykot6pgB6xaqm+ufMwSOheJx
 kaPH1WRTXBMXdoDx7tah9Uo=
X-Google-Smtp-Source: ABdhPJzE0w8a1EUnCb8+N+o88195mo8zyCfk7RaMpAeEMwDqODLOd41DhbRcU4JE0L8TzBro5r+qtg==
X-Received: by 2002:aca:52d1:: with SMTP id g200mr3364497oib.44.1613060415125; 
 Thu, 11 Feb 2021 08:20:15 -0800 (PST)
Received: from Davids-MacBook-Pro.local ([8.48.134.33])
 by smtp.googlemail.com with ESMTPSA id g66sm1081686otg.54.2021.02.11.08.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 08:20:14 -0800 (PST)
Subject: Re: [PATCH iproute2-next v5 0/5] Add vdpa device management tool
To: Parav Pandit <parav@nvidia.com>,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 stephen@networkplumber.org, mst@redhat.com, jasowang@redhat.com
References: <20210210183445.1009795-1-parav@nvidia.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <f5748e77-0004-4452-c413-15272a594d76@gmail.com>
Date: Thu, 11 Feb 2021 09:20:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210183445.1009795-1-parav@nvidia.com>
Content-Language: en-US
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

On 2/10/21 11:34 AM, Parav Pandit wrote:
> Linux vdpa interface allows vdpa device management functionality.
> This includes adding, removing, querying vdpa devices.
> 
> vdpa interface also includes showing supported management devices
> which support such operations.
> 
> This patchset includes kernel uapi headers and a vdpa tool.
> 

applied to iproute2-next.

I am expecting a followup converting devlink to use the indent and mnl
helpers.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
