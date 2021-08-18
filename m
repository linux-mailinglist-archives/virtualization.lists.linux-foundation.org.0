Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6E3EFA57
	for <lists.virtualization@lfdr.de>; Wed, 18 Aug 2021 07:47:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97E9405DC;
	Wed, 18 Aug 2021 05:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKb5tvkpsc21; Wed, 18 Aug 2021 05:47:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 721A840477;
	Wed, 18 Aug 2021 05:47:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F416BC000E;
	Wed, 18 Aug 2021 05:46:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9C6BC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 05:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71D6606FF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 05:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbwwsjAGZCHu
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 05:46:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94E61606DF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 05:46:55 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0Ujd4jSh_1629265611; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0Ujd4jSh_1629265611) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 18 Aug 2021 13:46:51 +0800
Subject: Re: [Virtio-fs] [virtiofsd PATCH v4 4/4] virtiofsd: support per-file
 DAX in FUSE_LOOKUP
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
 <20210817022347.18098-1-jefflexu@linux.alibaba.com>
 <20210817022347.18098-5-jefflexu@linux.alibaba.com>
 <YRwHRmL/jUSqgkIU@work-vm>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <29627110-e4bf-836f-2343-1faeb36ad4d3@linux.alibaba.com>
Date: Wed, 18 Aug 2021 13:46:51 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRwHRmL/jUSqgkIU@work-vm>
Content-Language: en-US
Cc: miklos@szeredi.hu, virtualization@lists.linux-foundation.org,
 virtio-fs@redhat.com, joseph.qi@linux.alibaba.com, stefanha@redhat.com,
 linux-fsdevel@vger.kernel.org, vgoyal@redhat.com
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



On 8/18/21 3:00 AM, Dr. David Alan Gilbert wrote:
> * Jeffle Xu (jefflexu@linux.alibaba.com) wrote:
>> For passthrough, when the corresponding virtiofs in guest is mounted
>> with '-o dax=inode', advertise that the file is capable of per-file
>> DAX if the inode in the backend fs is marked with FS_DAX_FL flag.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  tools/virtiofsd/passthrough_ll.c | 43 ++++++++++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 5b6228210f..4cbd904248 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -171,6 +171,7 @@ struct lo_data {
>>      int allow_direct_io;
>>      int announce_submounts;
>>      int perfile_dax_cap; /* capability of backend fs */
>> +    bool perfile_dax; /* enable per-file DAX or not */
>>      bool use_statx;
>>      struct lo_inode root;
>>      GHashTable *inodes; /* protected by lo->mutex */
>> @@ -716,6 +717,10 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
>>  
>>      if (conn->capable & FUSE_CAP_PERFILE_DAX && lo->perfile_dax_cap ) {
>>          conn->want |= FUSE_CAP_PERFILE_DAX;
>> +	lo->perfile_dax = 1;
>> +    }
>> +    else {
>> +	lo->perfile_dax = 0;
>>      }
>>  }
>>  
>> @@ -983,6 +988,41 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
>>      return 0;
>>  }
>>  
>> +/*
>> + * If the file is marked with FS_DAX_FL or FS_XFLAG_DAX, then DAX should be
>> + * enabled for this file.
>> + */
>> +static bool lo_should_enable_dax(struct lo_data *lo, struct lo_inode *dir,
>> +				 const char *name)
>> +{
>> +    int res, fd;
>> +    int ret = false;;
>> +    unsigned int attr;
>> +    struct fsxattr xattr;
>> +
>> +    if (!lo->perfile_dax)
>> +	return false;
>> +
>> +    /* Open file without O_PATH, so that ioctl can be called. */
>> +    fd = openat(dir->fd, name, O_NOFOLLOW);
>> +    if (fd == -1)
>> +        return false;
> 
> Doesn't that defeat the whole benefit of using O_PATH - i.e. that we
> might stumble into a /dev node or something else we're not allowed to
> open?

As far as I know, virtiofsd will pivot_root/chroot to the source
directory, and can only access files inside the source directory
specified by "-o source=". Then where do these unexpected files come
from? Besides, fd opened without O_PATH here is temporary and used for
FS_IOC_GETFLAGS/FS_IOC_FSGETXATTR ioctl only. It's closed when the
function returns.

> 
>> +    if (lo->perfile_dax_cap == DAX_CAP_FLAGS) {
>> +        res = ioctl(fd, FS_IOC_GETFLAGS, &attr);
>> +        if (!res && (attr & FS_DAX_FL))
>> +	    ret = true;
>> +    }
>> +    else if (lo->perfile_dax_cap == DAX_CAP_XATTR) {
>> +	res = ioctl(fd, FS_IOC_FSGETXATTR, &xattr);
>> +	if (!res && (xattr.fsx_xflags & FS_XFLAG_DAX))
>> +	    ret = true;
>> +    }
> 
> This all looks pretty expensive for each lookup.

Yes. it can be somehow optimized if we can agree on the way of storing
the dax flag persistently.

-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
