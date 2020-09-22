Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D12738E8
	for <lists.virtualization@lfdr.de>; Tue, 22 Sep 2020 04:51:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E2D1822621;
	Tue, 22 Sep 2020 02:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtLAXUX2pw9P; Tue, 22 Sep 2020 02:51:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6003D220C1;
	Tue, 22 Sep 2020 02:51:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36DB6C0051;
	Tue, 22 Sep 2020 02:51:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C7C8C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 02:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 06E5385764
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 02:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyBf4d1WJXpS
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 02:51:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 826F585102
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 02:51:19 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k133so5971222pgc.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 19:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GEH2ouQ/FrnoeV2ifHjtr5VvhmLz9Uk83pyAGiMJ9mI=;
 b=RIlvrCGl8Md2JyNUjPe4NQl+jkaLLO7ve4ofmxUcmKCPRYGDJQdptPPEyGLtZ1NCbJ
 ET80KTCEvTnzsizoe7WPw1Btbplkaa/WvGG0FbRI87IKS0wddmAhvNyWsK4WsjVzhble
 ESumP7FkT+EIK6gSVkjLK+NMyab4z99KXPK+7Zend9fAsjsvBlzZjxVmUa5YrUj+tPsQ
 jbsw2owytzdAK6GWz4pU6yCN2rcPeaMvdpifFSkE+n+dWcZq9DMMEjCf9AKTB9hj2ZY4
 ZxGVJnvQPwKxYZUFFzSrIxEJ+P5CXfdJqS4H1TxGmHKJRsiZ6lopc1R4Z/zzEJLs9O4s
 8lWA==
X-Gm-Message-State: AOAM532FjFOP9//WGJfVJee5aQNgFAjDOsyMLyn3Ai01NsmmK3/Cil1s
 84jU159Da+LAOMzjZ34ZZTd7Vvms+QE=
X-Google-Smtp-Source: ABdhPJykidwpfujICftdXOECgGbvv7xW0qg0g80Ktd47bH1WSCmI7ik7bpUTCBcrJdJ7oWm0g1FSTA==
X-Received: by 2002:a17:902:aa0a:b029:d0:89f4:6224 with SMTP id
 be10-20020a170902aa0ab02900d089f46224mr2734907plb.12.1600743078615; 
 Mon, 21 Sep 2020 19:51:18 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:5e05:892c:575b:24c7?
 ([2601:647:4000:d7:5e05:892c:575b:24c7])
 by smtp.gmail.com with ESMTPSA id 190sm13710253pfy.22.2020.09.21.19.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 19:51:17 -0700 (PDT)
Subject: Re: [PATCH 4/8] vhost scsi: fix cmd completion race
From: Bart Van Assche <bvanassche@acm.org>
To: Mike Christie <michael.christie@oracle.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org
References: <1600712588-9514-1-git-send-email-michael.christie@oracle.com>
 <1600712588-9514-5-git-send-email-michael.christie@oracle.com>
 <cf8e5b11-dfd2-4570-1dab-25486c591dde@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <89c3be36-c03f-c8a0-c4dc-d46d57de86ae@acm.org>
Date: Mon, 21 Sep 2020 19:51:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cf8e5b11-dfd2-4570-1dab-25486c591dde@acm.org>
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

On 2020-09-21 19:48, Bart Van Assche wrote:
> On 2020-09-21 11:23, Mike Christie wrote:
>> We might not do the final se_cmd put from vhost_scsi_complete_cmd_work.
>> If the last put happens a little later then we could race where
>> vhost_scsi_complete_cmd_work does vhost_signal, the guest runs and sends
>> more IO, and vhost_scsi_handle_vq runs but does not find any free cmds.
>>
>> This patch has us delay completing the cmd until the last lio core ref
>> is dropped. We then know that once we signal to the guest that the cmd
>> is completed that if it queues a new command it will find a free cmd.
> 
> It seems weird to me to see a reference to LIO in the description of a
> vhost patch? Since this driver supports more backends than LIO, shouldn't
> the patch description be made more generic?

Please ignore the above comment.

Bart.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
